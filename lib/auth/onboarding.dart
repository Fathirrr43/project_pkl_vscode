// Import package Flutter dan halaman login
import 'package:flutter/material.dart';
import 'package:tridaya_travel/auth/login.dart';

// Widget utama untuk OnBoarding
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // Controller untuk mengatur perpindahan halaman
  final PageController _pageController = PageController(initialPage: 0);

  // Variabel untuk menyimpan halaman saat ini
  int _currentPage = 0;

  // Data konten onboarding (gambar, judul, deskripsi)
  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/Ob1.png',
      'title': 'Temukan Jadwal Keberangkatan',
      'description': 'Dapatkan informasi lengkap jadwal keberangkatan umrah dan haji.',
    },
    {
      'image': 'assets/images/Ob2.png',
      'title': 'Layanan Umrah dan Haji Terpercaya',
      'description': 'Kami menyediakan layanan terbaik untuk perjalanan ibadah Anda.',
    },
  ];

  @override
  void dispose() {
    // Buang controller agar tidak boros memori
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Gunakan Stack agar bisa menumpuk PageView & indikator
        children: [
          // PageView untuk swipe antar halaman onboarding
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page; // update halaman saat ini
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                image: _onboardingData[index]['image']!,
                title: _onboardingData[index]['title']!,
                description: _onboardingData[index]['description']!,
              );
            },
          ),

          // Bagian bawah: indikator titik + tombol
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Indikator titik (dot) untuk menunjukkan halaman aktif
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) => buildDot(index: index), // panggil widget dot
                  ),
                ),

                // Tombol hanya muncul di halaman terakhir
                if (_currentPage == _onboardingData.length - 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman Login, ganti halaman onboarding
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          'Mulai Sekarang',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget indikator titik (dot)
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6, // aktif = lebar 20, nonaktif = 6
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// Halaman konten onboarding (satu layar)
class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // konten di tengah
        children: [
          // Gambar utama
          Image.asset(
            image,
            fit: BoxFit.contain,
            height: 250,
          ),
          const SizedBox(height: 40),

          // Judul
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Deskripsi
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
