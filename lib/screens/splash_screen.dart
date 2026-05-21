import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _loadingAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _loadingAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            // Title
            Center(
              child: Column(
                children: [
                  Text(
                    'Barakhadi',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.onPrimary,
                      shadows: [
                        const Shadow(
                          color: AppColors.primaryFixedDim,
                          offset: Offset(0, 4),
                        ),
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 8),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Buddy',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.onPrimary,
                      shadows: [
                        const Shadow(
                          color: AppColors.primaryFixedDim,
                          offset: Offset(0, 4),
                        ),
                        Shadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 8),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Mascot
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.inversePrimary,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/images/mascot.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const Positioned(
                  top: -10,
                  right: -10,
                  child: Icon(
                    Icons.auto_awesome,
                    color: AppColors.primaryFixedDim,
                    size: 40,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  left: -10,
                  child: Icon(
                    Icons.star,
                    color: AppColors.secondaryContainer,
                    size: 32,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Play Button
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value,
                  child: child,
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryContainer,
                  foregroundColor: AppColors.onSecondary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  side: const BorderSide(
                    color: AppColors.onSecondaryContainer,
                    width: 0, // In CSS it was border-b-8, which is hard in Flutter with ElevatedButton, using custom Container for bottom border is better but keeping it simple
                  ),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.play_arrow, size: 32),
                    const SizedBox(width: 8),
                    Text(
                      'Play!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: AppColors.onSecondary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Loading Bar
            Container(
              width: 200,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outlineVariant, width: 2),
              ),
              alignment: Alignment.centerLeft,
              child: AnimatedBuilder(
                animation: _loadingAnimation,
                builder: (context, child) {
                  return FractionallySizedBox(
                    widthFactor: _loadingAnimation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryFixedDim,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Loading fun...',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.onPrimaryFixedVariant.withOpacity(0.8),
                  ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
