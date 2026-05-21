import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLow,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.outlineVariant, width: 2),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        title: Text(
          'Parent Dashboard',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryContainer,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.secondary, width: 4),
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 40, color: AppColors.onSecondaryContainer, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aryan',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: 32,
                            ),
                      ),
                      Text(
                        'Learning since: May 2024',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Stats
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context,
                      title: 'Total Time',
                      value: '14h',
                      icon: Icons.timer,
                      color: AppColors.primaryContainer,
                      onColor: AppColors.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      title: 'Learned',
                      value: '24',
                      icon: Icons.abc,
                      color: AppColors.tertiaryContainer,
                      onColor: AppColors.onTertiaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      title: 'Streak',
                      value: '3',
                      icon: Icons.local_fire_department,
                      color: AppColors.secondaryContainer,
                      onColor: AppColors.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Progress Chart Placeholder
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.outlineVariant, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learning Progress',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(Icons.bar_chart, size: 64, color: AppColors.outlineVariant),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Recent Activity
              Text(
                'Recent Activity',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              _buildActivityItem(
                context,
                title: 'Traced Letter क',
                time: 'Today, 10:30 AM',
                icon: Icons.edit,
                color: AppColors.primaryContainer,
              ),
              _buildActivityItem(
                context,
                title: 'Earned 3 Stars',
                time: 'Yesterday, 4:15 PM',
                icon: Icons.star,
                color: AppColors.tertiaryContainer,
              ),
              _buildActivityItem(
                context,
                title: 'Completed Number Match',
                time: 'Monday, 2:00 PM',
                icon: Icons.onetwothree,
                color: AppColors.secondaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required Color onColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: onColor.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Icon(icon, color: onColor, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: onColor,
                  fontSize: 28,
                ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: onColor,
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(BuildContext context, {
    required String title,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant, width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.onSurface),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.onSurfaceVariant,
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
