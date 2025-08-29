// Import library bawaan Flutter dan package yang dibutuhkan
import 'dart:async'; // untuk Timer
import 'dart:math'; // untuk random posisi bintang
import 'package:flutter/material.dart';
import 'package:tridaya_travel/auth/onboarding.dart'; // halaman tujuan setelah splash

// Widget utama SplashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// State untuk mengatur animasi
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  // Controller animasi untuk bintang, logo outline, logo isi, dan teks
  late AnimationController _starController;
  late AnimationController _logoOutlineController;
  late AnimationController _logoFillController;
  late AnimationController _textController;

  @override
  void initState() {
    super.initState();

    // Animasi bintang berulang
    _starController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // animasi berulang tanpa henti

    // Animasi garis outline logo
    _logoOutlineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Animasi isi/logo terisi warna
    _logoFillController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Animasi munculnya teks
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Urutan animasi agar lebih halus
    Future.delayed(const Duration(milliseconds: 400), () {
      _logoOutlineController.forward(); // gambar outline dulu
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      _logoFillController.forward(); // kemudian isi logo
    });
    Future.delayed(const Duration(milliseconds: 1800), () {
      _textController.forward(); // terakhir teks
    });

    // Setelah 3 detik, pindah ke halaman OnBoarding
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  void dispose() {
    // Membersihkan controller animasi agar tidak boros memori
    _starController.dispose();
    _logoOutlineController.dispose();
    _logoFillController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // ukuran layar
    final logoSize = size.width * 0.38; // ukuran logo

    return Scaffold(
      body: Stack( // menggunakan Stack agar bisa overlay komponen
        children: [
          // Background dengan warna gradasi biru tua
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0B1636), Color(0xFF233A66)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Lapisan bintang bergerak
          AnimatedBuilder(
            animation: _starController,
            builder: (context, child) {
              return CustomPaint(
                size: size,
                painter: _StarryNightPainter(_starController.value), // custom painter
              );
            },
          ),

          // Animasi garis outline logo
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

          // Isi logo dengan efek gradasi
          AnimatedBuilder(
            animation: _logoFillController,
            builder: (context, child) {
              return Center(
                child: Opacity(
                  opacity: _logoFillController.value, // perlahan muncul
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
                      'assets/images/logo.png', // logo utama
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),

          // Animasi teks fade-in
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

// CustomPainter untuk menggambar bintang yang melayang
class _StarryNightPainter extends CustomPainter {
  final double progress;
  final List<Offset> _stars = []; // posisi bintang
  final List<double> _sizes = []; // ukuran bintang
  final int _starCount = 32; // jumlah bintang
  final Random _random = Random(2024); // random generator tetap

  _StarryNightPainter(this.progress) {
    // Inisialisasi posisi bintang hanya sekali
    if (_stars.isEmpty) {
      for (int i = 0; i < _starCount; i++) {
        _stars.add(Offset(_random.nextDouble(), _random.nextDouble()));
        _sizes.add(1.5 + _random.nextDouble() * 2.5); // variasi ukuran bintang
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.7);
    for (int i = 0; i < _starCount; i++) {
      final dx = _stars[i].dx * size.width; // posisi horizontal
      final dy = (_stars[i].dy * size.height +
              progress * 30 * (i % 2 == 0 ? 1 : -1)) %
          size.height; // posisi vertikal bergerak naik-turun
      canvas.drawCircle(Offset(dx, dy), _sizes[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarryNightPainter oldDelegate) => true;
}

// CustomPainter untuk menggambar outline logo
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

    // Membuat bentuk kotak dengan sudut tumpul
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

    // Hitung total panjang path
    final totalLength = path.computeMetrics().fold(
          0.0,
          (sum, m) => sum + m.length,
        );
    final currentLength = totalLength * progress; // bagian yang digambar sesuai progress

    var drawn = 0.0;
    for (final metric in path.computeMetrics()) {
      final len = metric.length;
      final drawLen = (drawn + len <= currentLength)
          ? len
          : (currentLength - drawn).clamp(0, len);
      if (drawLen > 0) {
        final extract = metric.extractPath(0, drawLen.toDouble());
        canvas.drawPath(extract, paint); // menggambar path
      }
      drawn += len;
      if (drawn >= currentLength) break;
    }
  }

  @override
  bool shouldRepaint(covariant _LogoOutlinePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
