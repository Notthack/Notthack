import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import '../widgets/nourish_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  bool _obscure = true;
  String? _error;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() => _error = 'Enter your email and password.');
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    final err = await AuthService.instance.login(email, password);
    if (!mounted) return;
    setState(() => _loading = false);
    if (err != null) {
      setState(() => _error = err);
      return;
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  void _fillDemo(String email) {
    _emailController.text = email;
    _passwordController.text = 'password123';
    setState(() => _error = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NourishColors.cream,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 980;
            final content = ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1180),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(flex: 5, child: _buildStoryPanel()),
                          const SizedBox(width: 18),
                          Expanded(flex: 4, child: _buildLoginPanel()),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildStoryPanel(),
                            const SizedBox(height: 18),
                            _buildLoginPanel(),
                          ],
                        ),
                      ),
              ),
            );

            return Center(child: content);
          },
        ),
      ),
    );
  }

  Widget _buildStoryPanel() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [NourishColors.ink, Color(0xFF204B42)],
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: NourishColors.ink.withValues(alpha: 0.16),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              NourishBrandMark(size: 52),
              SizedBox(width: 14),
              Expanded(
                child: Text(
                  'NourishChain',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              NourishPill(
                label: 'Wallet-free student pass',
                icon: Icons.qr_code_2,
                background: Color(0x1AFFFFFF),
                foreground: Colors.white,
              ),
              NourishPill(
                label: 'Solana localnet trust layer',
                icon: Icons.link,
                background: Color(0x1AFFFFFF),
                foreground: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            'NourishChain keeps one hard thing simple: who can redeem, who can revoke, and who can audit.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              height: 1.1,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Student Affairs issues the benefit, students show a QR only, merchants verify and redeem, and the auditor sees the same history. The blockchain layer stays narrow and visible where disputes actually happen.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.86),
              fontSize: 14,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              SizedBox(
                width: 190,
                child: NourishMetricCard(
                  label: 'role surfaces',
                  value: '4',
                  accent: NourishColors.green,
                  icon: Icons.grid_view_rounded,
                ),
              ),
              SizedBox(
                width: 190,
                child: NourishMetricCard(
                  label: 'student wallet',
                  value: '0',
                  accent: NourishColors.blue,
                  icon: Icons.phonelink_off,
                ),
              ),
              SizedBox(
                width: 190,
                child: NourishMetricCard(
                  label: 'shared trust state',
                  value: '1 layer',
                  accent: NourishColors.gold,
                  icon: Icons.shield_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const NourishInlineNotice(
            icon: Icons.campaign_outlined,
            title: 'Demo path',
            body:
                'Login as issuer, student, merchant, or auditor. The app is designed so each screen tells one part of the trust story without blockchain jargon.',
            accent: Colors.white,
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              NourishPill(
                label: 'Issuer issues and revokes',
                icon: Icons.admin_panel_settings,
                background: Color(0x14FFFFFF),
                foreground: Colors.white,
              ),
              NourishPill(
                label: 'Merchant verifies then redeems',
                icon: Icons.storefront,
                background: Color(0x14FFFFFF),
                foreground: Colors.white,
              ),
              NourishPill(
                label: 'Auditor sees history',
                icon: Icons.history,
                background: Color(0x14FFFFFF),
                foreground: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginPanel() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: NourishColors.ink,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.ramen_dining,
                    color: Colors.white, size: 28),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NourishChain',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: NourishColors.ink)),
                    SizedBox(height: 2),
                    Text('Sign in to a role-specific demo surface',
                        style: TextStyle(
                            fontSize: 13, color: NourishColors.slate)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const NourishInlineNotice(
            icon: Icons.lock_outline,
            title: 'Access pattern',
            body:
                'This demo uses role-based sessions. Use the demo accounts below and the password password123.',
            accent: NourishColors.green,
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.mail_outline),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: _obscure,
            autofillHints: const [AutofillHints.password],
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline,
                      size: 18, color: Colors.red.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _loading ? null : _submit,
            icon: _loading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.login),
            label: Text(_loading ? 'Signing in...' : 'Sign in'),
          ),
          const SizedBox(height: 18),
          const Text('Demo accounts',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: NourishColors.slate)),
          const SizedBox(height: 8),
          _demoAccount('Student — Aisha', 'aisha@student.uni.edu',
              Icons.qr_code_2, NourishColors.green),
          _demoAccount('Student — Ravi', 'ravi@student.uni.edu',
              Icons.qr_code_2, NourishColors.green),
          _demoAccount('Issuer — Student Affairs', 'affairs@uni.edu',
              Icons.admin_panel_settings, NourishColors.blue),
          _demoAccount('Merchant — Cafeteria A', 'cafe-a@merchant.uni.edu',
              Icons.storefront, Color(0xFFE37A4A)),
          _demoAccount('Merchant — Cafeteria B', 'cafe-b@merchant.uni.edu',
              Icons.storefront, Color(0xFFE37A4A)),
          _demoAccount('Merchant — Cafeteria X (blocked)',
              'cafe-x@merchant.uni.edu', Icons.storefront, Color(0xFFE37A4A)),
          _demoAccount('Auditor — Finance', 'audit@uni.edu',
              Icons.history, NourishColors.violet),
          const SizedBox(height: 14),
          const Text(
            'Blockchain-backed • zero personal data on-chain',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11.5, color: NourishColors.slate),
          ),
        ],
      ),
    );
  }

  Widget _demoAccount(String label, String email, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: _loading ? null : () => _fillDemo(email),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600)),
                    Text(email,
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black45,
                            fontFamily: 'monospace')),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right,
                  size: 18, color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }
}
