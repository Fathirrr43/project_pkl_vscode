import 'package:flutter/material.dart';
import 'package:tridaya_travel/widgets/textview.dart';
import 'package:tridaya_travel/views/faq.dart' show Faq;
import 'package:tridaya_travel/views/lokasi.dart';
import 'package:tridaya_travel/views/sholat.dart';
import 'package:tridaya_travel/views/umrah.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Banner
              Container(
                width: double.infinity,
                height: 265,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E4584), Color(0xFF3A7BD5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.png'),
                    fit: BoxFit.cover, // Mengisi penuh, dipotong jika perlu
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Pelayanan Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textView(
                      EdgeInsets.zero,
                      "Pelayanan",
                      TextAlign.left,
                      Colors.black, // warna hitam
                      FontWeight.bold,
                      18.0,
                    ),
                    textView(
                      EdgeInsets.zero,
                      "Lainnya",
                      TextAlign.right,
                      Colors.black, // warna hitam
                      FontWeight.w500,
                      14.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              // Service Icons (Restored)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServiceIcon(
                      assetIcon: 'assets/icons/umrah.png',
                      label: "Paket Umrah",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaketUmrah()),
                        );
                      },
                    ),
                    ServiceIcon(
                      assetIcon: 'assets/icons/cabang.png',
                      label: "Lokasi Cabang",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LokasiCabang(),
                          ),
                        );
                      },
                    ),
                    ServiceIcon(
                      assetIcon: 'assets/icons/sholat.png',
                      label: "Waktu Shalat",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaktuShalat(),
                          ),
                        );
                      },
                    ),
                    ServiceIcon(
                      assetIcon: 'assets/icons/faq.png',
                      label: "FAQ",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Faq()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              // Berita Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textView(
                      EdgeInsets.zero,
                      "Berita",
                      TextAlign.left,
                      Colors.black, // warna hitam
                      FontWeight.bold,
                      18.0,
                    ),
                    textView(
                      EdgeInsets.zero,
                      "Lainnya",
                      TextAlign.right,
                      Colors.black, // warna hitam
                      FontWeight.w500,
                      14.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: NewsCard(
                        image: 'assets/images/makkah.png',
                        title: 'Kenaikan Jamaah Tahun 2023',
                        desc: 'Informasi terbaru seputar jamaah dan umrah.',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: NewsCard(
                        image: 'assets/images/madinah.png',
                        title: 'Panduan Lengkap Ibadah Jamaah',
                        desc: 'Tips dan panduan ibadah selama di tanah suci.',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationBarProvider.selectedIndex,
        onTap: (index) {
          bottomNavigationBarProvider.updateIndex(index);
          // TODO: Implement navigation to different screens based on index
          // For now, let's just print the selected index.
          print('Selected index: $index');
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFF1E4584),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomNavigationBarProvider.selectedIndex == 0
                  ? 'assets/icons/beranda2.png' // Inactive icon
                  : 'assets/icons/beranda.png', // Active icon
              width: 24,
              height: 24,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomNavigationBarProvider.selectedIndex == 1
                  ? 'assets/icons/keberangkatan2.png' // Inactive icon
                  : 'assets/icons/keberangkatan.png', // Active icon
              width: 24,
              height: 24,
            ),
            label: 'Keberangkatan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomNavigationBarProvider.selectedIndex == 2
                  ? 'assets/icons/jadwal2.png' // Inactive icon
                  : 'assets/icons/jadwal.png', // Active icon
              width: 24,
              height: 24,
            ),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomNavigationBarProvider.selectedIndex == 3
                  ? 'assets/icons/profile2.png' // Inactive icon
                  : 'assets/icons/profile.png', // Active icon
              width: 24,
              height: 24,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Assuming you have a NewsCard widget defined elsewhere
class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String desc;

  const NewsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textView(
                  EdgeInsets.zero,
                  title,
                  TextAlign.left,
                  Colors.black,
                  FontWeight.bold,
                  14.0,
                ),
                SizedBox(height: 4),
                textView(
                  EdgeInsets.zero,
                  desc,
                  TextAlign.left,
                  Colors.grey[600]!,
                  FontWeight.normal,
                  12.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final String assetIcon;
  final String label;
  final VoidCallback onTap;

  const ServiceIcon({
    Key? key,
    required this.assetIcon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            assetIcon,
            width: 40,
            height: 40,
          ),
          SizedBox(height: 4),
          textView(
            EdgeInsets.zero,
            label,
            TextAlign.center,
            Colors.black,
            FontWeight.normal,
            12.0,
          ),
        ],
      ),
    );
  }
}
