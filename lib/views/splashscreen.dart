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
  late AnimationController _fadeController;
  late AnimationController _assembleController;
  late AnimationController _shineController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _assembleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _shineController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    _fadeController.forward();
    Future.delayed(
      Duration(milliseconds: 800),
      () => _assembleController.forward(),
    );
    Future.delayed(
      Duration(milliseconds: 2000),
      () => _shineController.forward(),
    );

    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _assembleController.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient & particles
          Positioned.fill(child: AnimatedBackground()),
          // Logo animation
          Center(
            child: FadeTransition(
              opacity: _fadeController,
              child: AnimatedBuilder(
                animation: _assembleController,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Geometric logo pieces assembling
                      _LogoPiece(
                        offset: Offset(
                          -80 * (1 - _assembleController.value),
                          -80 * (1 - _assembleController.value),
                        ),
                        color: Colors.blue.shade700,
                        size: 80,
                        angle: pi / 6,
                      ),
                      _LogoPiece(
                        offset: Offset(
                          80 * (1 - _assembleController.value),
                          -80 * (1 - _assembleController.value),
                        ),
                        color: Colors.blue.shade400,
                        size: 80,
                        angle: -pi / 6,
                      ),
                      _LogoPiece(
                        offset: Offset(
                          -80 * (1 - _assembleController.value),
                          80 * (1 - _assembleController.value),
                        ),
                        color: Colors.blue.shade900,
                        size: 80,
                        angle: pi / 3,
                      ),
                      _LogoPiece(
                        offset: Offset(
                          80 * (1 - _assembleController.value),
                          80 * (1 - _assembleController.value),
                        ),
                        color: Colors.blue.shade300,
                        size: 80,
                        angle: -pi / 3,
                      ),
                      // Center emblem
                      Container(
                        width: 360,
                        height: 360,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF1E4584), // Biru tua
                              Color(0xFF3A7BD5), // Biru terang
                              Colors.white, // Putih untuk efek glossy
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 32),
                          ],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            CustomPaint(
                              painter: ShinePainter(_shineController.value),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // App name
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Fathir',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 2,
                  shadows: [Shadow(color: Colors.black26, blurRadius: 8)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Logo piece widget
class _LogoPiece extends StatelessWidget {
  final Offset offset;
  final Color color;
  final double size;
  final double angle;
  const _LogoPiece({
    required this.offset,
    required this.color,
    required this.size,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: color.withOpacity(0.3), blurRadius: 12),
            ],
          ),
        ),
      ),
    );
  }
}

// Shine effect painter
class ShinePainter extends CustomPainter {
  final double progress;
  ShinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    if (progress > 0) {
      final rect = Offset.zero & size;
      final shineWidth = size.width * 0.4;
      final shineRect = Rect.fromLTWH(
        size.width * progress - shineWidth / 2,
        0,
        shineWidth,
        size.height,
      );
      final paint =
          Paint()
            ..shader = LinearGradient(
              colors: [
                Colors.white.withOpacity(0.0),
                Colors.white.withOpacity(0.6),
                Colors.white.withOpacity(0.0),
              ],
              stops: [0.0, 0.5, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(shineRect);
      canvas.drawRect(shineRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ShinePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

// Animated background with radial gradient and floating particles
class AnimatedBackground extends StatefulWidget {
  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat();
    _particles = List.generate(18, (i) => _Particle());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _BackgroundPainter(_controller.value, _particles),
          child: Container(),
        );
      },
    );
  }
}

class _Particle {
  double x = Random().nextDouble();
  double y = Random().nextDouble();
  double size = 12 + Random().nextDouble() * 18;
  double speed = 0.2 + Random().nextDouble() * 0.5;
  Color color = Colors.white.withOpacity(0.18 + Random().nextDouble() * 0.18);
}

class _BackgroundPainter extends CustomPainter {
  final double progress;
  final List<_Particle> particles;
  _BackgroundPainter(this.progress, this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    // Radial gradient background
    final gradient = RadialGradient(
      colors: [Color(0xFF1E4584), Color(0xFF3A7BD5), Colors.white],
      stops: [0.0, 0.7, 1.0],
      center: Alignment.topCenter,
      radius: 1.2,
    );
    final rect = Offset.zero & size;
    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // Floating particles
    for (var p in particles) {
      final dx = size.width * (p.x + sin(progress * 2 * pi * p.speed) * 0.02);
      final dy = size.height * (p.y + cos(progress * 2 * pi * p.speed) * 0.02);
      canvas.drawCircle(Offset(dx, dy), p.size, Paint()..color = p.color);
    }

    // Abstract waves (optional, simple sine waves)
    final wavePaint =
        Paint()
          ..color = Colors.white.withOpacity(0.08)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
    for (int i = 0; i < 3; i++) {
      final path = Path();
      for (double x = 0; x < size.width; x += 4) {
        final y =
            size.height * 0.7 +
            sin((x / size.width * 2 * pi) + progress * 2 * pi + i) *
                (18 + i * 8);
        if (x == 0)
          path.moveTo(x, y);
        else
          path.lineTo(x, y);
      }
      canvas.drawPath(path, wavePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) => true;
}
