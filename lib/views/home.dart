import 'package:flutter/material.dart';
import 'package:tridaya_travel/widgets/textview.dart';
import 'package:tridaya_travel/views/faq.dart' show Faq;
import 'package:tridaya_travel/views/lokasi.dart';
import 'package:tridaya_travel/views/shalat.dart';
import 'package:tridaya_travel/views/umrah.dart';
import 'package:tridaya_travel/views/berita.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> beritaUtamaHome = [
    {
      "judul": "Kuota Haji 2026 Diumumkan 10 Juli 2025",
      "waktu": "Baru saja",
      "gambar": "assets/images/berita(1).png",
      "url":
          "https://www.suarasurabaya.net/kelanakota/2025/kuota-haji-2026-diumumkan-10-juli-2025-kemenag-tunggu-keputusan-saudi/",
      "deskripsi": "Informasi terbaru terkait kuota haji 2026.",
    },
    {
      "judul": "Perluasan Tahap Ketiga Masjidil Haram",
      "waktu": "Baru saja",
      "gambar": "assets/images/berita(2).png",
      "url":
          "https://www.nu.or.id/internasional/perluasan-tahap-ketiga-masjidil-haram-selesai-bisa-tampung-3-juta-orang-4DZ4y",
      "deskripsi": "Peningkatan fasilitas dan kapasitas Masjidil Haram.",
    },
    {
      "judul":
          "Paviliun Bandara Jeddah, Ruang Singgah Jamaah Haji Penuh Cerita",
      "waktu": "Baru saja",
      "gambar": "assets/images/berita(4).png",
      "url":
          "https://rm.id/baca-berita/humaniora/266921/kabar-dari-tanah-suci-paviliun-bandara-jeddah-ruang-singgah-jemaah-haji-penuh-cerita",
      "deskripsi": "Kisah-kisah menarik dari Paviliun Bandara Jeddah.",
    },
  ];
  // Fungsi buka url
  Future<void> _bukaUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        // Wrap with SafeArea
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Banner
              Container(
                width: double.infinity,
                height: 265,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E4584), Color(0xFF3A7BD5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),

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
                      Colors.black,
                      FontWeight.bold,
                      18.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Service Icons
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

              const SizedBox(height: 24),

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
                      Colors.black,
                      FontWeight.bold,
                      18.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Berita()),
                        );
                      },
                      child: textView(
                        EdgeInsets.zero,
                        "Lainnya",
                        TextAlign.right,
                        Colors.black,
                        FontWeight.w500,
                        14.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Berita Carousel
              SizedBox(
                height: 220, // Adjusted height for the carousel
                child: PageView.builder(
                  itemCount: beritaUtamaHome.length,
                  controller: PageController(
                    viewportFraction: 0.85,
                  ), // Show part of the next item for carousel effect
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ), // Add padding here
                      child: AspectRatio(
                        aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                        child: InkWell(
                          onTap:
                              () =>
                                  _bukaUrl(beritaUtamaHome[index]["url"] ?? ""),
                          child: NewsCardNetwork(
                            imageUrl: beritaUtamaHome[index]["gambar"] ?? "",
                            title: beritaUtamaHome[index]["judul"] ?? "",
                            desc: beritaUtamaHome[index]["deskripsi"] ?? "",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// NewsCardNetwork untuk gambar dari URL
class NewsCardNetwork extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  const NewsCardNetwork({
    Key? key,
    required this.imageUrl,
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
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imageUrl,
              height: 120, // Adjusted image height
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
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
                const SizedBox(height: 4),
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
          Image.asset(assetIcon, width: 40, height: 40),
          const SizedBox(height: 4),
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
