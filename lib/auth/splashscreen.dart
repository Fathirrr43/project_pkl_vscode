import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _starController;
  late AnimationController _kabahController;
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

    _kabahController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

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
      _kabahController.forward();
    });
    Future.delayed(const Duration(milliseconds: 1400), () {
      _logoOutlineController.forward();
    });
    Future.delayed(const Duration(milliseconds: 2100), () {
      _logoFillController.forward();
    });
    Future.delayed(const Duration(milliseconds: 2800), () {
      _textController.forward();
    });

    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  void dispose() {
    _starController.dispose();
    _kabahController.dispose();
    _logoOutlineController.dispose();
    _logoFillController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = size.width * 0.38;
    final kabahWidth = size.width * 0.45;
    final kabahHeight = size.height * 0.18;

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
          // Floating stars/particles
          AnimatedBuilder(
            animation: _starController,
            builder: (context, child) {
              return CustomPaint(
                size: size,
                painter: _StarryNightPainter(_starController.value),
              );
            },
          ),
          // Ka'bah silhouette fade in with glow
          AnimatedBuilder(
            animation: _kabahController,
            builder: (context, child) {
              return Center(
                child: Opacity(
                  opacity: _kabahController.value,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glow behind Ka'bah
                      Container(
                        width: kabahWidth * 1.2,
                        height: kabahHeight * 1.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.amber.shade100.withOpacity(
                                0.5 * _kabahController.value,
                              ),
                              Colors.transparent,
                            ],
                            stops: const [0.4, 1.0],
                          ),
                        ),
                      ),
                      // Ka'bah silhouette (replace with your own asset if available)
                      CustomPaint(
                        size: Size(kabahWidth, kabahHeight),
                        painter: _KabahPainter(),
                      ),
                    ],
                  ),
                ),
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
          // Logo fill with gradient and light
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
                      shape: BoxShape.rectangle,
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

// Painter for floating stars/particles
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
      final dy =
          (_stars[i].dy * size.height + progress * 30 * (i % 2 == 0 ? 1 : -1)) %
          size.height;
      canvas.drawCircle(Offset(dx, dy), _sizes[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarryNightPainter oldDelegate) => true;
}

// Painter for Ka'bah silhouette
class _KabahPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final base = Rect.fromLTWH(
      size.width * 0.18,
      size.height * 0.45,
      size.width * 0.64,
      size.height * 0.38,
    );
    final paint = Paint()..color = Colors.black.withOpacity(0.92);
    canvas.drawRRect(
      RRect.fromRectAndRadius(base, Radius.circular(size.width * 0.05)),
      paint,
    );
    // Gold band
    final gold = Paint()..color = Colors.amber.shade200;
    canvas.drawRect(
      Rect.fromLTWH(
        base.left,
        base.top + base.height * 0.18,
        base.width,
        base.height * 0.09,
      ),
      gold,
    );
    // Door
    final door = Paint()..color = Colors.amber.shade100;
    canvas.drawRect(
      Rect.fromLTWH(
        base.left + base.width * 0.7,
        base.top + base.height * 0.55,
        base.width * 0.18,
        base.height * 0.28,
      ),
      door,
    );
    // Glow
    final glow =
        Paint()
          ..color = Colors.amber.shade100.withOpacity(0.18)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        base.inflate(10),
        Radius.circular(size.width * 0.07),
      ),
      glow,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Painter for logo outline animation
class _LogoOutlinePainter extends CustomPainter {
  final double progress;
  _LogoOutlinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.8)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.07
          ..strokeCap = StrokeCap.round;

    // Simple outline: rounded rectangle (replace with your logo path for more detail)
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
      final drawLen =
          (drawn + len <= currentLength)
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
