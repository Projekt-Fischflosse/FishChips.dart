import 'package:flutter/material.dart';
import 'package:fish_chips/ui/theme/app_theme.dart';

class MenuBarTabs extends StatelessWidget {
  const MenuBarTabs({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0x14000000)),
        ),
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Quiz', icon: Icon(Icons.play_arrow)),
            Tab(text: 'Scoreboard', icon: Icon(Icons.emoji_events_outlined)),
            Tab(text: 'Einstellung', icon: Icon(Icons.settings_outlined)),
            Tab(text: 'Über uns', icon: Icon(Icons.info_outline)),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: AppTheme.text.withOpacity(0.70),
          indicator: BoxDecoration(
            color: cs.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          padding: const EdgeInsets.all(6),
        ),
      ),
    );
  }
}