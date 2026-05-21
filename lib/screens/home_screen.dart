import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Aryan!',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.primary,
                      fontSize: 32, // display-lg-mobile
                    ),
              ),
              const SizedBox(height: 24),
              _buildStreakBanner(context),
              const SizedBox(height: 32),
              Text(
                'What shall we learn today?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  _buildMenuCard(
                    context,
                    title: 'Learn Barakhadi',
                    icon: Icons.abc,
                    backgroundColor: AppColors.primaryContainer,
                    borderColor: AppColors.primary,
                    iconColor: AppColors.onPrimaryContainer,
                    onTap: () => context.go('/tracing'),
                  ),
                  _buildMenuCard(
                    context,
                    title: 'Numbers',
                    icon: Icons.onetwothree,
                    backgroundColor: AppColors.tertiaryContainer,
                    borderColor: AppColors.tertiary,
                    iconColor: AppColors.onTertiaryContainer,
                    onTap: () {},
                  ),
                  _buildMenuCard(
                    context,
                    title: 'Mini Games',
                    icon: Icons.extension,
                    backgroundColor: AppColors.secondaryContainer,
                    borderColor: AppColors.secondary,
                    iconColor: AppColors.onSecondaryContainer,
                    onTap: () {},
                  ),
                  _buildMenuCard(
                    context,
                    title: 'Rewards',
                    icon: Icons.stars,
                    backgroundColor: const Color(0xFFFFD8E4), // Bubblegum pink
                    borderColor: const Color(0xFF98004B),
                    iconColor: const Color(0xFF310015),
                    onTap: () => context.go('/reward'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.inversePrimary, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/mascot.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.outlineVariant, width: 2),
            ),
            child: IconButton(
              icon: const Icon(Icons.settings, color: AppColors.primary),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }

  Widget _buildStreakBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_fire_department, color: AppColors.error, size: 32),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 Day Streak!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.onPrimaryContainer,
                        fontSize: 20,
                      ),
                ),
                Text(
                  'Keep it up!',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.onPrimaryFixedVariant,
                      ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.onPrimaryContainer),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color borderColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: borderColor.withOpacity(0.5),
              blurRadius: 0,
              offset: const Offset(0, 4), // Tactile "3D" effect
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: iconColor),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: iconColor,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.outlineVariant, width: 4),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, 'Learn', Icons.auto_stories, true, () {}),
              _buildNavItem(context, 'Play', Icons.smart_toy, false, () {}),
              _buildNavItem(context, 'Rewards', Icons.stars, false, () => context.go('/reward')),
              _buildNavItem(context, 'Parent', Icons.family_restroom, false, () => context.go('/parent')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String label, IconData icon,
      bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? AppColors.secondaryFixed : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: isActive ? AppColors.onSecondaryFixed : AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isActive ? AppColors.onSecondaryFixed : AppColors.onSurfaceVariant,
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
