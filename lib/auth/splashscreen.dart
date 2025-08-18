import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tridaya_travel/auth/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _starController;
  late AnimationController _logoOutlineController;
  late AnimationController _logoFillController;
  late AnimationController _textController;

  @override
  void initState() {
    super.initState();

    _starController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _logoOutlineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _logoFillController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Animation sequence
    Future.delayed(const Duration(milliseconds: 400), () {
      _logoOutlineController.forward();
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      _logoFillController.forward();
    });
    Future.delayed(const Duration(milliseconds: 1800), () {
      _textController.forward();
    });

    Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  void dispose() {
    _starController.dispose();
    _logoOutlineController.dispose();
    _logoFillController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = size.width * 0.38;

    return Scaffold(
      body: Stack(
        children: [
          // Midnight blue gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0B1636), Color(0xFF233A66)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Floating stars
          AnimatedBuilder(
            animation: _starController,
            builder: (context, child) {
              return CustomPaint(
                size: size,
                painter: _StarryNightPainter(_starController.value),
              );
            },
          ),

          // Logo outline drawing
          AnimatedBuilder(
            animation: _logoOutlineController,
            builder: (context, child) {
              return Center(
                child: CustomPaint(
                  size: Size(logoSize, logoSize),
                  painter: _LogoOutlinePainter(_logoOutlineController.value),
                ),
              );
            },
          ),

          // Logo fill with gradient
          AnimatedBuilder(
            animation: _logoFillController,
            builder: (context, child) {
              return Center(
                child: Opacity(
                  opacity: _logoFillController.value,
                  child: Container(
                    width: logoSize,
                    height: logoSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.85),
                          const Color(0xFF3A7BD5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(
                            0.18 * _logoFillController.value,
                          ),
                          blurRadius: 32,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),

          // Text fade in
          AnimatedBuilder(
            animation: _textController,
            builder: (context, child) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.12),
                  child: Opacity(
                    opacity: _textController.value,
                    child: Text(
                      "Tridaya Tour & Travel",
                      style: TextStyle(
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade100,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.white.withOpacity(0.25),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Painter for floating stars
class _StarryNightPainter extends CustomPainter {
  final double progress;
  final List<Offset> _stars = [];
  final List<double> _sizes = [];
  final int _starCount = 32;
  final Random _random = Random(2024);

  _StarryNightPainter(this.progress) {
    if (_stars.isEmpty) {
      for (int i = 0; i < _starCount; i++) {
        _stars.add(Offset(_random.nextDouble(), _random.nextDouble()));
        _sizes.add(1.5 + _random.nextDouble() * 2.5);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.7);
    for (int i = 0; i < _starCount; i++) {
      final dx = _stars[i].dx * size.width;
      final dy = (_stars[i].dy * size.height +
              progress * 30 * (i % 2 == 0 ? 1 : -1)) %
          size.height;
      canvas.drawCircle(Offset(dx, dy), _sizes[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarryNightPainter oldDelegate) => true;
}

// Painter for logo outline animation
class _LogoOutlinePainter extends CustomPainter {
  final double progress;
  _LogoOutlinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(
      size.width * 0.08,
      size.height * 0.08,
      size.width * 0.84,
      size.height * 0.84,
    );

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(size.width * 0.18),
    );

    final path = Path()..addRRect(rrect);

    final totalLength = path.computeMetrics().fold(
          0.0,
          (sum, m) => sum + m.length,
        );
    final currentLength = totalLength * progress;

    var drawn = 0.0;
    for (final metric in path.computeMetrics()) {
      final len = metric.length;
      final drawLen = (drawn + len <= currentLength)
          ? len
          : (currentLength - drawn).clamp(0, len);
      if (drawLen > 0) {
        final extract = metric.extractPath(0, drawLen.toDouble());
        canvas.drawPath(extract, paint);
      }
      drawn += len;
      if (drawn >= currentLength) break;
    }
  }

  @override
  bool shouldRepaint(covariant _LogoOutlinePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
