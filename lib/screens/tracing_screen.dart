import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class TracingScreen extends StatefulWidget {
  const TracingScreen({super.key});

  @override
  State<TracingScreen> createState() => _TracingScreenState();
}

class _TracingScreenState extends State<TracingScreen> {
  List<Offset?> _points = [];

  void _clearCanvas() {
    setState(() {
      _points.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
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
          'मराठी शाळा',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.primary,
                fontSize: 32,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Progress Tracker
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.outlineVariant, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 1 / 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '1/12',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Bubble
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.secondaryContainer,
                borderRadius: BorderRadius.circular(32),
                border: const Border(
                  bottom: BorderSide(color: AppColors.secondary, width: 4),
                ),
              ),
              child: Text(
                'गिरवा! (Trace it!)',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.onSecondaryContainer,
                    ),
              ),
            ),
            const SizedBox(height: 24),
            // Canvas
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.outlineVariant, width: 4),
                    ),
                    child: Stack(
                      children: [
                        // Background Guidelines (simulated)
                        Center(
                          child: Icon(Icons.architecture, size: 200, color: AppColors.outlineVariant.withOpacity(0.3)),
                        ),
                        // The actual drawing canvas
                        GestureDetector(
                          onPanUpdate: (details) {
                            RenderBox renderBox = context.findRenderObject() as RenderBox;
                            setState(() {
                              _points.add(renderBox.globalToLocal(details.globalPosition));
                            });
                          },
                          onPanEnd: (details) {
                            setState(() {
                              _points.add(null);
                            });
                          },
                          child: CustomPaint(
                            painter: DrawingPainter(points: _points),
                            size: Size.infinite,
                          ),
                        ),
                        // Audio Button
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primary, width: 2),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.volume_up, color: AppColors.onPrimaryContainer),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    right: -10,
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset('assets/images/mascot.png'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            // Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _clearCanvas,
                    icon: const Icon(Icons.cleaning_services),
                    label: const Text('Clear'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.surfaceContainerHigh,
                      foregroundColor: AppColors.onSurfaceVariant,
                      side: const BorderSide(color: AppColors.outlineVariant, width: 2),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.go('/reward'),
                    icon: const Text('Next'),
                    label: const Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      foregroundColor: AppColors.onPrimaryContainer,
                      side: const BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primary
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        // Adjust points based on local offset if necessary, but globalToLocal is used
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
