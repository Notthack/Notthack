import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/nourish_components.dart';
import 'auditor_screen.dart';
import 'issuer_screen.dart';
import 'login_screen.dart';
import 'merchant_screen.dart';
import 'student_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _index;

  static const _tabs = <_HomeTab>[
    _HomeTab(label: 'Home', icon: Icons.home_rounded, index: 0),
    _HomeTab(label: 'Issuer', icon: Icons.admin_panel_settings, index: 1),
    _HomeTab(label: 'Student', icon: Icons.badge_outlined, index: 2),
    _HomeTab(label: 'Merchant', icon: Icons.storefront, index: 3),
    _HomeTab(label: 'Auditor', icon: Icons.history, index: 4),
  ];

  @override
  void initState() {
    super.initState();
    _index = _roleToIndex(AuthService.instance.role);
  }

  int _roleToIndex(String? role) {
    switch (role) {
      case 'issuer':
        return 1;
      case 'student':
        return 2;
      case 'merchant':
        return 3;
      case 'auditor':
        return 4;
      default:
        return 0;
    }
  }

  Widget _pageFor(int index) {
    switch (index) {
      case 1:
        return const IssuerScreen();
      case 2:
        return const StudentScreen();
      case 3:
        return const MerchantScreen();
      case 4:
        return const AuditorScreen();
      default:
        return const _OverviewPane();
    }
  }

  Future<void> _logout(BuildContext context) async {
    await AuthService.instance.logout();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthService.instance;
    if (!auth.isLoggedIn) {
      return const LoginScreen();
    }

    return Scaffold(
      backgroundColor: NourishColors.cream,
      appBar: AppBar(
        titleSpacing: 16,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: NourishColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 78,
        title: Row(
          children: [
            const NourishBrandMark(size: 42),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NourishChain',
                  style: const TextStyle(
                    color: NourishColors.ink,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  auth.displayName ?? auth.email ?? 'Signed in',
                  style: const TextStyle(
                    color: NourishColors.slate,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: NourishPill(
              label: _tabs[_index].label,
              icon: _tabs[_index].icon,
              background: const Color(0x113D6DE1),
              foreground: NourishColors.blue,
              borderColor: const Color(0x223D6DE1),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: List.generate(_tabs.length, _pageFor),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (next) => setState(() => _index = next),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Issuer',
          ),
          NavigationDestination(icon: Icon(Icons.badge_outlined), label: 'Student'),
          NavigationDestination(icon: Icon(Icons.storefront), label: 'Merchant'),
          NavigationDestination(icon: Icon(Icons.history), label: 'Auditor'),
        ],
      ),
    );
  }
}


class _OverviewPane extends StatelessWidget {
  const _OverviewPane();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 980;
        final cards = const [
          _OverviewCard(
            title: 'Issuer / Student Affairs',
            subtitle: 'Issue, revoke, override',
            body:
                'Seed or issue a voucher, revoke it if eligibility changes, and log a manual override when an appeal is approved.',
            icon: Icons.admin_panel_settings,
            accent: NourishColors.green,
          ),
          _OverviewCard(
            title: 'Student / Beneficiary',
            subtitle: 'Wallet-free QR pass',
            body:
                'Show one QR, one voucher, and one clear status. No wallet terminology, no crypto steps, no extra clutter.',
            icon: Icons.badge_outlined,
            accent: NourishColors.blue,
          ),
          _OverviewCard(
            title: 'Merchant / Cafeteria',
            subtitle: 'Scan, verify, redeem',
            body:
                'Scan the pass, verify before redeeming, and block duplicate or revoked attempts before the cashier proceeds.',
            icon: Icons.storefront,
            accent: NourishColors.gold,
          ),
          _OverviewCard(
            title: 'Auditor / Compliance',
            subtitle: 'History and trust',
            body:
                'Inspect the same event trail, state counts, and on-chain / off-chain markers that explain what happened.',
            icon: Icons.history,
            accent: NourishColors.violet,
          ),
        ];

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NourishHeaderPanel(
                roleLabel: 'NourishChain dashboard',
                headline: 'Choose the role, then show the trust story.',
                body:
                    'The home screen is the switchboard. The bottom tabs move between the four operational surfaces, while this overview explains the demo path in one glance.',
                badges: const [
                  NourishPill(
                    label: 'Wallet-free student pass',
                    icon: Icons.phonelink_off,
                    background: Color(0x14FFFFFF),
                    foreground: Colors.white,
                  ),
                  NourishPill(
                    label: 'Localnet live',
                    icon: Icons.link,
                    background: Color(0x14FFFFFF),
                    foreground: Colors.white,
                  ),
                ],
                trailing: Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
                  ),
                  child: const NourishBrandMark(size: 74, framed: false),
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  SizedBox(
                    width: 180,
                    child: NourishMetricCard(
                      label: 'roles',
                      value: '4',
                      accent: NourishColors.green,
                      icon: Icons.grid_view_rounded,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: NourishMetricCard(
                      label: 'chain scope',
                      value: 'narrow',
                      accent: NourishColors.blue,
                      icon: Icons.shield_outlined,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: NourishMetricCard(
                      label: 'student wallet',
                      value: 'none',
                      accent: NourishColors.gold,
                      icon: Icons.phonelink_off,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              NourishActionCard(
                title: 'Demo sequence',
                body:
                    'Use the app in this order for the cleanest judge story: issuer prepares or revokes, student shows the QR, merchant verifies and redeems, auditor inspects the same trail.',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    _SequenceRow(
                      step: '01',
                      title: 'Issuer / Student Affairs',
                      body: 'Issue or revoke a voucher and log override decisions.',
                      accent: NourishColors.green,
                    ),
                    SizedBox(height: 10),
                    _SequenceRow(
                      step: '02',
                      title: 'Student / Beneficiary',
                      body: 'Show a wallet-free QR pass and current voucher state.',
                      accent: NourishColors.blue,
                    ),
                    SizedBox(height: 10),
                    _SequenceRow(
                      step: '03',
                      title: 'Merchant / Cafeteria',
                      body: 'Verify first, redeem once, and block duplicates or revoked vouchers.',
                      accent: NourishColors.gold,
                    ),
                    SizedBox(height: 10),
                    _SequenceRow(
                      step: '04',
                      title: 'Auditor / Finance',
                      body: 'Inspect the event trail and the live chain status.',
                      accent: NourishColors.violet,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              if (isWide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: cards[0]),
                    const SizedBox(width: 12),
                    Expanded(child: cards[1]),
                  ],
                )
              else
                Column(
                  children: [
                    cards[0],
                    const SizedBox(height: 12),
                    cards[1],
                  ],
                ),
              const SizedBox(height: 12),
              if (isWide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: cards[2]),
                    const SizedBox(width: 12),
                    Expanded(child: cards[3]),
                  ],
                )
              else
                Column(
                  children: [
                    cards[2],
                    const SizedBox(height: 12),
                    cards[3],
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String body;
  final IconData icon;
  final Color accent;

  const _OverviewCard({
    required this.title,
    required this.subtitle,
    required this.body,
    required this.icon,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return NourishActionCard(
      title: title,
      body: body,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: accent, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: accent,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Open this tab to run the operational version of the surface.',
                  style: TextStyle(
                    color: NourishColors.slate,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SequenceRow extends StatelessWidget {
  final String step;
  final String title;
  final String body;
  final Color accent;

  const _SequenceRow({
    required this.step,
    required this.title,
    required this.body,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: Text(
            step,
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: NourishColors.ink,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                body,
                style: const TextStyle(
                  color: NourishColors.slate,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HomeTab {
  final String label;
  final IconData icon;
  final int index;

  const _HomeTab({
    required this.label,
    required this.icon,
    required this.index,
  });
}
