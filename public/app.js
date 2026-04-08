const state = {
  bootstrap: null,
  selectedMerchantId: null,
  selectedVoucherId: null,
  selectedStudentId: null,
};

const els = {
  bootstrapStatus: document.getElementById("bootstrapStatus"),
  stats: document.getElementById("stats"),
  merchantSelect: document.getElementById("merchantSelect"),
  merchantVoucherSelect: document.getElementById("merchantVoucherSelect"),
  issuerStudentSelect: document.getElementById("issuerStudentSelect"),
  studentSelect: document.getElementById("studentSelect"),
  auditVoucherSelect: document.getElementById("auditVoucherSelect"),
  merchantResult: document.getElementById("merchantResult"),
  issuerResult: document.getElementById("issuerResult"),
  qrFrame: document.getElementById("qrFrame"),
  studentName: document.getElementById("studentName"),
  studentVoucherMeta: document.getElementById("studentVoucherMeta"),
  studentVoucherState: document.getElementById("studentVoucherState"),
  qrPayloadPreview: document.getElementById("qrPayloadPreview"),
  voucherTimeline: document.getElementById("voucherTimeline"),
  auditFeed: document.getElementById("auditFeed"),
  voucherSnapshot: document.getElementById("voucherSnapshot"),
  newVoucherId: document.getElementById("newVoucherId"),
  overrideReason: document.getElementById("overrideReason"),
  trustVoucher: document.getElementById("trustVoucher"),
  trustState: document.getElementById("trustState"),
  trustCheckpoint: document.getElementById("trustCheckpoint"),
};

async function api(path, options = {}) {
  const response = await fetch(path, {
    headers: { "content-type": "application/json", ...(options.headers || {}) },
    ...options,
  });
  const text = await response.text();
  let body;
  try {
    body = JSON.parse(text);
  } catch {
    body = text;
  }

  return {
    ok: response.ok,
    status: response.status,
    body,
  };
}

function escapeHtml(value = "") {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

function optionHtml(items, valueKey, labelFn) {
  return items
    .map((item) => `<option value="${escapeHtml(item[valueKey])}">${escapeHtml(labelFn(item))}</option>`)
    .join("");
}

function setBootstrapStatus(message, tone = "good") {
  els.bootstrapStatus.textContent = message;
  els.bootstrapStatus.className = `status-chip ${tone}`;
}

function stateTone(status) {
  if (["valid", "redeemed", "active"].includes(status)) return "good";
  if (["revoked", "already_redeemed", "merchant_not_approved", "unknown_voucher", "error"].includes(status)) return "bad";
  return "neutral";
}

function renderPseudoQr(seed) {
  const size = 21;
  const cells = [];
  const source = `${seed}|MEAL|PASS|BGA`;
  let cursor = 0;

  for (let row = 0; row < size; row += 1) {
    for (let col = 0; col < size; col += 1) {
      const code = source.charCodeAt(cursor % source.length);
      const active = ((code >> (cursor % 5)) + row + col) % 2 === 0;
      const inFinder =
        (row < 7 && col < 7) ||
        (row < 7 && col >= size - 7) ||
        (row >= size - 7 && col < 7);
      const fill = inFinder ? (row % 2 === 0 || col % 2 === 0 ? "#102033" : "#ffffff") : active ? "#102033" : "#ffffff";
      cells.push(`<rect x="${col * 10}" y="${row * 10}" width="10" height="10" fill="${fill}" />`);
      cursor += 1;
    }
  }

  return `
    <svg viewBox="0 0 ${size * 10} ${size * 10}" role="img" aria-label="Wallet-free student QR pass">
      <rect width="100%" height="100%" rx="16" fill="#ffffff"></rect>
      ${cells.join("")}
    </svg>
  `;
}

function renderStats() {
  const { vouchers, merchants, students } = state.bootstrap;
  const activeCount = vouchers.filter((voucher) => voucher.state === "active").length;
  const redeemedCount = vouchers.filter((voucher) => voucher.state === "redeemed").length;

  els.stats.innerHTML = [
    { label: "Deployment", value: "1 campus" },
    { label: "Students", value: students.length },
    { label: "Approved merchants", value: merchants.filter((merchant) => merchant.approved).length },
    { label: "Shared states", value: `${activeCount} active / ${redeemedCount} redeemed` },
  ]
    .map(
      (item) => `
        <div class="stat">
          <div class="label">${item.label}</div>
          <div class="value">${item.value}</div>
        </div>`,
    )
    .join("");
}

function renderSelects() {
  const { merchants, vouchers, students, defaultMerchantId, defaultStudentId, defaultVoucherId } = state.bootstrap;

  els.merchantSelect.innerHTML = optionHtml(merchants, "merchantId", (merchant) => `${merchant.name} (${merchant.merchantId})`);
  els.merchantVoucherSelect.innerHTML = optionHtml(vouchers, "voucherId", (voucher) => `${voucher.voucherId} · ${voucher.studentName} · ${voucher.state}`);
  els.issuerStudentSelect.innerHTML = optionHtml(students, "studentId", (student) => `${student.displayName} (${student.studentId})`);
  els.studentSelect.innerHTML = optionHtml(students, "studentId", (student) => `${student.displayName} (${student.studentId})`);
  els.auditVoucherSelect.innerHTML = optionHtml(vouchers, "voucherId", (voucher) => `${voucher.voucherId} · ${voucher.state}`);

  state.selectedMerchantId = defaultMerchantId ?? merchants[0]?.merchantId ?? null;
  state.selectedStudentId = defaultStudentId ?? students[0]?.studentId ?? null;
  state.selectedVoucherId = defaultVoucherId ?? vouchers[0]?.voucherId ?? null;

  els.merchantSelect.value = state.selectedMerchantId;
  els.issuerStudentSelect.value = state.selectedStudentId;
  els.studentSelect.value = state.selectedStudentId;
  els.merchantVoucherSelect.value = state.selectedVoucherId;
  els.auditVoucherSelect.value = state.selectedVoucherId;
}

function updateTrustBox(voucherId) {
  const voucher = state.bootstrap.vouchers.find((entry) => entry.voucherId === voucherId);
  els.trustVoucher.textContent = voucher?.voucherId ?? "n/a";
  els.trustState.textContent = voucher?.state ?? "unknown";
  els.trustCheckpoint.textContent = voucher?.checkpoint ?? "pending";
}

function renderVoucherTimeline(voucherId) {
  const events = state.bootstrap.auditEvents.filter((event) => event.voucherId === voucherId);
  els.voucherTimeline.innerHTML = events.length
    ? events
        .map(
          (event) => `
            <div class="timeline-item">
              <strong>${escapeHtml(event.type.replaceAll("_", " "))}</strong>
              <div>${escapeHtml(event.message ?? "No detail")}</div>
              <div class="event-meta">${escapeHtml(event.timestamp ?? "")} · checkpoint ${escapeHtml(event.checkpoint ?? "n/a")}</div>
            </div>`,
        )
        .join("")
    : "<div class='timeline-item'>No voucher events yet.</div>";

  const voucher = state.bootstrap.vouchers.find((entry) => entry.voucherId === voucherId) ?? null;
  els.voucherSnapshot.textContent = voucher ? JSON.stringify(voucher, null, 2) : "";
  updateTrustBox(voucherId);
}

function renderAuditFeed() {
  els.auditFeed.innerHTML = state.bootstrap.auditEvents.length
    ? state.bootstrap.auditEvents
        .slice(0, 10)
        .map(
          (event) => `
            <div class="feed-item">
              <strong>${escapeHtml(event.type.replaceAll("_", " "))}</strong>
              <div>${escapeHtml(event.message ?? "No detail")}</div>
              <div class="event-meta">${escapeHtml(event.timestamp ?? "")} · ${escapeHtml(event.voucherId ?? "n/a")}</div>
            </div>`,
        )
        .join("")
    : "<div class='feed-item'>No program events yet.</div>";
}

function setResult(node, status, title, message, checkpoint) {
  node.className = `result ${stateTone(status)}`;
  node.innerHTML = `
    <div class="badge ${escapeHtml(status)}">${escapeHtml(status)}</div>
    <strong>${escapeHtml(title)}</strong>
    <div>${escapeHtml(message)}</div>
    ${checkpoint ? `<div class="event-meta">checkpoint: ${escapeHtml(checkpoint)}</div>` : ""}
  `;
}

async function renderStudentPass() {
  const studentId = els.studentSelect.value;
  state.selectedStudentId = studentId;

  const selectedVoucher =
    state.bootstrap.vouchers.find((voucher) => voucher.studentId === studentId) ??
    state.bootstrap.vouchers.find((voucher) => voucher.voucherId === state.selectedVoucherId) ??
    null;

  if (!selectedVoucher) {
    els.studentVoucherState.textContent = "no voucher";
    els.studentVoucherState.className = "badge";
    els.studentName.textContent = "No student selected";
    els.studentVoucherMeta.textContent = "Issue a voucher first.";
    els.qrPayloadPreview.textContent = "";
    els.qrFrame.innerHTML = "";
    return;
  }

  const response = await api(`/api/student/${selectedVoucher.voucherId}`);
  if (!response.ok) {
    throw new Error(response.body.error ?? "student pass failed");
  }

  const pass = response.body;
  els.studentVoucherState.textContent = pass.status;
  els.studentVoucherState.className = `badge ${pass.status}`;
  els.studentName.textContent = pass.studentName;
  els.studentVoucherMeta.textContent = `${pass.label} · ${pass.voucherId}`;
  els.qrPayloadPreview.textContent = `QR payload: ${pass.voucherId} | wallet-free presentation`;
  els.qrFrame.innerHTML = renderPseudoQr(pass.voucherId);
}

async function refreshBootstrap(message = "Demo state ready") {
  const response = await api("/api/bootstrap");
  if (!response.ok) {
    throw new Error(response.body.error ?? "bootstrap failed");
  }

  state.bootstrap = response.body;
  renderStats();
  renderSelects();
  renderAuditFeed();
  renderVoucherTimeline(state.selectedVoucherId);
  await renderStudentPass();
  setBootstrapStatus(message, "good");
}

async function verifyVoucher() {
  const response = await api("/api/merchant/verify", {
    method: "POST",
    body: JSON.stringify({
      merchantId: els.merchantSelect.value,
      voucherId: els.merchantVoucherSelect.value,
    }),
  });

  const payload = response.body;
  setResult(
    els.merchantResult,
    payload.status,
    payload.title,
    payload.message,
    payload.checkpointRef ?? payload.voucher?.checkpoint ?? null,
  );
  renderVoucherTimeline(els.merchantVoucherSelect.value);
}

async function redeemVoucher() {
  const response = await api("/api/merchant/redeem", {
    method: "POST",
    body: JSON.stringify({
      merchantId: els.merchantSelect.value,
      voucherId: els.merchantVoucherSelect.value,
    }),
  });

  const payload = response.body;
  setResult(
    els.merchantResult,
    payload.status,
    payload.title,
    payload.message,
    payload.checkpointRef ?? null,
  );
  await refreshBootstrap(response.ok ? "Redeem path updated" : "Blocked state captured");
  els.merchantVoucherSelect.value = payload.voucherId ?? els.merchantVoucherSelect.value;
  els.auditVoucherSelect.value = payload.voucherId ?? els.auditVoucherSelect.value;
  renderVoucherTimeline(els.merchantVoucherSelect.value);
}

async function issueVoucher() {
  const response = await api("/api/issuer/issue", {
    method: "POST",
    body: JSON.stringify({
      studentId: els.issuerStudentSelect.value,
      voucherId: els.newVoucherId.value.trim() || undefined,
      note: "Issued from demo issuer console",
    }),
  });

  if (!response.ok) {
    throw new Error(response.body.error ?? "issue failed");
  }

  const voucherId = response.body.voucher.voucherId;
  setResult(els.issuerResult, "active", "Voucher issued", `Voucher ${voucherId} created.`, null);
  els.newVoucherId.value = "";
  await refreshBootstrap("New voucher issued");
  els.merchantVoucherSelect.value = voucherId;
  els.auditVoucherSelect.value = voucherId;
  renderVoucherTimeline(voucherId);
}

async function revokeVoucher() {
  const voucherId = els.auditVoucherSelect.value;
  const response = await api("/api/issuer/revoke", {
    method: "POST",
    body: JSON.stringify({
      voucherId,
      reasonCode: "Eligibility revoked by Student Affairs",
    }),
  });

  if (!response.ok) {
    throw new Error(response.body.error ?? "revoke failed");
  }

  setResult(els.issuerResult, "revoked", "Voucher revoked", `Voucher ${voucherId} is now revoked.`, null);
  await refreshBootstrap("Revocation recorded");
  renderVoucherTimeline(voucherId);
}

async function logOverride() {
  const voucherId = els.auditVoucherSelect.value;
  const response = await api("/api/issuer/override", {
    method: "POST",
    body: JSON.stringify({
      voucherId,
      overrideReason: els.overrideReason.value.trim() || "Manual override approved",
    }),
  });

  if (!response.ok) {
    throw new Error(response.body.error ?? "override failed");
  }

  setResult(
    els.issuerResult,
    "active",
    "Override logged",
    "Staff approved the exception off-chain and logged the override event for audit.",
    response.body.checkpointRef,
  );
  await refreshBootstrap("Override event logged");
  renderVoucherTimeline(voucherId);
}

async function resetDemo() {
  const response = await api("/api/reset", { method: "POST" });
  if (!response.ok) {
    throw new Error(response.body.error ?? "reset failed");
  }
  sessionStorage.setItem("bga-demo-initialized", "1");
  await refreshBootstrap("Demo reset to the seeded happy path");
  setResult(
    els.merchantResult,
    "active",
    "Ready",
    "Seeded voucher VCH-1001 is active. Show the student pass, then verify and redeem it once.",
    null,
  );
  setResult(els.issuerResult, "active", "Ready", "Issuer console is ready for issue, revoke, or override.", null);
}

function wireEvents() {
  document.getElementById("refreshBtn").addEventListener("click", () => refreshBootstrap("Data refreshed").catch(handleError));
  document.getElementById("resetBtn").addEventListener("click", () => resetDemo().catch(handleError));
  document.getElementById("verifyBtn").addEventListener("click", () => verifyVoucher().catch(handleError));
  document.getElementById("redeemBtn").addEventListener("click", () => redeemVoucher().catch(handleError));
  document.getElementById("issueBtn").addEventListener("click", () => issueVoucher().catch(handleError));
  document.getElementById("revokeBtn").addEventListener("click", () => revokeVoucher().catch(handleError));
  document.getElementById("overrideBtn").addEventListener("click", () => logOverride().catch(handleError));

  els.studentSelect.addEventListener("change", () => renderStudentPass().catch(handleError));
  els.auditVoucherSelect.addEventListener("change", () => {
    state.selectedVoucherId = els.auditVoucherSelect.value;
    els.merchantVoucherSelect.value = state.selectedVoucherId;
    renderVoucherTimeline(state.selectedVoucherId);
  });
  els.merchantVoucherSelect.addEventListener("change", () => {
    state.selectedVoucherId = els.merchantVoucherSelect.value;
    els.auditVoucherSelect.value = state.selectedVoucherId;
    renderVoucherTimeline(state.selectedVoucherId);
  });
}

function handleError(error) {
  console.error(error);
  setBootstrapStatus(error.message ?? "Unexpected error", "bad");
  setResult(els.merchantResult, "error", "Request failed", error.message ?? "Unexpected error", null);
}

async function start() {
  wireEvents();
  const initialized = sessionStorage.getItem("bga-demo-initialized");
  if (!initialized) {
    await api("/api/reset", { method: "POST" });
    sessionStorage.setItem("bga-demo-initialized", "1");
  }
  await refreshBootstrap("Demo state ready");
  setResult(
    els.merchantResult,
    "active",
    "Ready",
    "Seeded voucher VCH-1001 is active. Verify first, then redeem once, then show the duplicate block.",
    null,
  );
  setResult(
    els.issuerResult,
    "active",
    "Issuer ready",
    "Issue a new voucher only if you want to branch the demo. Otherwise keep the seeded path.",
    null,
  );
}

start().catch(handleError);
