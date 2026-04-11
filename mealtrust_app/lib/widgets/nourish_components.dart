import 'package:flutter/material.dart';

class NourishColors {
  static const green = Color(0xFF0FAF8F);
  static const greenDark = Color(0xFF0C7F69);
  static const cream = Color(0xFFF5F1E8);
  static const ink = Color(0xFF17332D);
  static const gold = Color(0xFFC7A65A);
  static const amber = Color(0xFFF3B64D);
  static const blue = Color(0xFF3D6DE1);
  static const red = Color(0xFFD95F5F);
  static const violet = Color(0xFF7A54D8);
  static const teal = Color(0xFF0A8B78);
  static const paper = Color(0xFFFFFCF7);
  static const slate = Color(0xFF5C6B68);
}

class NourishBrandMark extends StatelessWidget {
  final double size;
  final BorderRadiusGeometry borderRadius;
  final bool framed;

  const NourishBrandMark({
    super.key,
    this.size = 42,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.framed = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: framed ? const EdgeInsets.all(6) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: framed ? Colors.white : Colors.transparent,
        borderRadius: borderRadius,
        border: framed ? Border.all(color: Colors.white.withValues(alpha: 0.18)) : null,
        boxShadow: framed
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.14),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Image.asset(
        'assets/brand/nourish_chain_logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class NourishShell extends StatelessWidget {
  final String roleLabel;
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final List<Widget> chips;
  final Widget child;
  final EdgeInsetsGeometry bodyPadding;
  final bool scrollable;

  const NourishShell({
    super.key,
    required this.roleLabel,
    required this.title,
    required this.subtitle,
    required this.child,
    this.actions = const [],
    this.chips = const [],
    this.bodyPadding = const EdgeInsets.fromLTRB(20, 16, 20, 24),
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: bodyPadding,
      child: child,
    );

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
                  title,
                  style: const TextStyle(
                    color: NourishColors.ink,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
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
          if (chips.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Row(mainAxisSize: MainAxisSize.min, children: chips),
            ),
          ...actions,
          const SizedBox(width: 4),
        ],
      ),
      body: scrollable
          ? SafeArea(
              top: false,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: body,
              ),
            )
          : SafeArea(top: false, child: body),
    );
  }
}

class NourishHeaderPanel extends StatelessWidget {
  final String roleLabel;
  final String headline;
  final String body;
  final List<Widget> badges;
  final Widget? trailing;

  const NourishHeaderPanel({
    super.key,
    required this.roleLabel,
    required this.headline,
    required this.body,
    this.badges = const [],
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: NourishColors.ink,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: NourishColors.ink.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(spacing: 8, runSpacing: 8, children: [
            NourishPill(
              label: roleLabel,
              icon: Icons.verified_user,
              background: Colors.white.withValues(alpha: 0.12),
              foreground: Colors.white,
            ),
            ...badges,
          ]),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headline,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      body,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.86),
                        fontSize: 13.5,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                trailing!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class NourishPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
  final Color? borderColor;

  const NourishPill({
    super.key,
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: borderColor == null ? null : Border.all(color: borderColor!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: foreground),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class NourishMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;
  final IconData icon;

  const NourishMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.accent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.16)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: accent),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: accent,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  color: NourishColors.slate,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NourishSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const NourishSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: NourishColors.ink,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: NourishColors.slate,
                    fontSize: 12.5,
                    height: 1.35,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class NourishStatusCard extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  final Color accent;
  final Widget? trailing;

  const NourishStatusCard({
    super.key,
    required this.title,
    required this.body,
    required this.icon,
    required this.accent,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: accent.withValues(alpha: 0.18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: accent, size: 20),
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
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    color: NourishColors.slate,
                    height: 1.35,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 10),
            trailing!,
          ],
        ],
      ),
    );
  }
}

class NourishActionCard extends StatelessWidget {
  final String title;
  final String body;
  final Widget child;

  const NourishActionCard({
    super.key,
    required this.title,
    required this.body,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: NourishColors.ink,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            body,
            style: const TextStyle(
              color: NourishColors.slate,
              height: 1.35,
              fontSize: 12.5,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class NourishInlineNotice extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final Color accent;

  const NourishInlineNotice({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: accent,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    color: NourishColors.slate,
                    fontSize: 12.5,
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
