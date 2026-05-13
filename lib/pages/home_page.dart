import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../sections/greeting_section.dart';
import '../sections/square_area_section.dart';
import '../sections/discount_section.dart';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;

  // Keys for scrolling to sections
  final _greetingKey = GlobalKey();
  final _squareKey = GlobalKey();
  final _discountKey = GlobalKey();

  final _scrollController = ScrollController();

  void _scrollToSection(int index) {
    setState(() => _selectedNavIndex = index);
    final key = [_greetingKey, _squareKey, _discountKey][index];
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ─── Top App Bar ───
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.school, color: AppColors.primary),
            const SizedBox(width: 12),
            Text(
              'Flutter Learning Hub',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.onSurfaceVariant),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: AppColors.onSurfaceVariant,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.outlineVariant,
            height: 1,
          ),
        ),
      ),

      // ─── Body ───
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 120),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                Text(
                  'Dart Functions',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Master the basics of Dart programming through interactive widget-based examples.',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    height: 1.5,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),

                // Greeting 
                Container(
                  key: _greetingKey,
                  child: const GreetingSection(),
                ),
                const SizedBox(height: 24),

                // Square Area 
                Container(
                  key: _squareKey,
                  child: const SquareAreaSection(),
                ),
                const SizedBox(height: 24),

                // Discount 
                Container(
                  key: _discountKey,
                  child: const DiscountSection(),
                ),
              ],
            ),
          ),
        ),
      ),

      // ─── Bottom Navigation Bar ───
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.sentiment_satisfied_outlined,
                  label: 'Greeting',
                  isSelected: _selectedNavIndex == 0,
                  onTap: () => _scrollToSection(0),
                ),
                _NavItem(
                  icon: Icons.square_foot,
                  label: 'Square',
                  isSelected: _selectedNavIndex == 1,
                  onTap: () => _scrollToSection(1),
                ),
                _NavItem(
                  icon: Icons.percent,
                  label: 'Discount',
                  isSelected: _selectedNavIndex == 2,
                  onTap: () => _scrollToSection(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A single navigation item in the bottom bar.
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? AppColors.onPrimaryContainer
                  : AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                color: isSelected
                    ? AppColors.onPrimaryContainer
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
