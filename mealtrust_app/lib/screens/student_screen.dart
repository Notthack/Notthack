import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/voucher.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../widgets/nourish_components.dart';
import 'login_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  bool _loading = false;
  Voucher? _voucher;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _lookupVoucher());
  }

  Future<void> _lookupVoucher() async {
    setState(() {
      _loading = true;
      _error = null;
      _voucher = null;
    });
    try {
      final voucher = await ApiService.getMyVoucher();
      if (!mounted) return;
      setState(() {
        _voucher = voucher;
        if (voucher == null) {
          _error = 'No active voucher found on your account yet.';
        }
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'Could not connect to server. Check your network.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _logout() async {
    await AuthService.instance.logout();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthService.instance;
    return NourishShell(
      roleLabel: 'Student / Beneficiary',
      title: 'NourishChain',
      subtitle: auth.displayName ?? auth.email ?? 'Signed in',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh pass',
          onPressed: _loading ? null : _lookupVoucher,
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Sign out',
          onPressed: _logout,
        ),
      ],
      chips: [
        NourishPill(
          label: 'Wallet-free',
          icon: Icons.phonelink_off,
          background: const Color(0x193D6DE1),
          foreground: NourishColors.blue,
          borderColor: const Color(0x263D6DE1),
        ),
      ],
      scrollable: false,
      child: RefreshIndicator(
        onRefresh: _lookupVoucher,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NourishHeaderPanel(
                roleLabel: 'Beneficiary pass',
                headline: 'One QR. One voucher. No wallet.',
                body:
                    'Show this pass at the cafeteria cashier. The student experience stays simple while the chain-backed trust state is handled behind the scenes.',
                badges: [
                  NourishPill(
                    label: 'Student ID ${auth.studentId ?? "-"}',
                    icon: Icons.badge_outlined,
                    background: const Color(0x14FFFFFF),
                    foreground: Colors.white,
                  ),
                ],
                trailing: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.14)),
                  ),
                  child: const Icon(Icons.qr_code_2,
                      color: Colors.white, size: 38),
                ),
              ),
              const SizedBox(height: 18),
              if (_loading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_error != null)
                NourishStatusCard(
                  title: 'Voucher unavailable',
                  body: _error!,
                  icon: Icons.error_outline,
                  accent: Colors.red,
                )
              else if (_voucher != null)
                _buildVoucherCard(_voucher!)
              else
                const NourishStatusCard(
                  title: 'No pass loaded yet',
                  body:
                      'Refresh to load your current voucher. If Student Affairs has not issued one yet, this screen remains empty.',
                  icon: Icons.hourglass_empty,
                  accent: NourishColors.green,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVoucherCard(Voucher voucher) {
    final stateColor = voucher.isActive
        ? NourishColors.green
        : voucher.isRedeemed
            ? NourishColors.blue
            : Colors.red;

    return NourishActionCard(
      title: 'Your voucher',
      body:
          'This card is the only thing you need to present. It is readable, wallet-free, and clear in every state.',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: stateColor.withValues(alpha: 0.18)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: stateColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(26)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    voucher.isActive
                        ? 'Active voucher'
                        : voucher.isRedeemed
                            ? 'Already redeemed'
                            : 'Revoked voucher',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${voucher.label ?? "Meal Support Voucher"} • ${voucher.amountLabel ?? "1 meal"}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  if (voucher.isActive)
                    QrImageView(
                      data: voucher.id,
                      version: QrVersions.auto,
                      size: 224,
                      backgroundColor: Colors.white,
                    )
                  else
                    Icon(
                      voucher.isRedeemed ? Icons.done_all : Icons.block,
                      size: 84,
                      color: stateColor.withValues(alpha: 0.45),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    voucher.isActive
                        ? 'Show this QR to the cashier.'
                        : voucher.isRedeemed
                            ? 'This pass has already been used.'
                            : 'This pass has been revoked by Student Affairs.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: NourishColors.slate,
                      fontSize: 13.5,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      NourishPill(
                        label: 'Voucher ${voucher.id}',
                        icon: Icons.confirmation_number_outlined,
                        background: stateColor.withValues(alpha: 0.08),
                        foreground: stateColor,
                        borderColor: stateColor.withValues(alpha: 0.18),
                      ),
                      if (voucher.redemptionCheckpointId != null)
                        NourishPill(
                          label: 'Checkpoint ${voucher.redemptionCheckpointId}',
                          icon: Icons.link,
                          background: Colors.black.withValues(alpha: 0.04),
                          foreground: NourishColors.ink,
                          borderColor: Colors.black.withValues(alpha: 0.06),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
