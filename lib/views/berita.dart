import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Berita extends StatelessWidget {
  Berita({super.key});

  // ==============================
  // DATA BERITA UTAMA (ASLI)
  // ==============================
  final List<Map<String, dynamic>> beritaUtama = [
    {
      "judul":
          "Kuota Haji 2026 Diumumkan 10 Juli 2025, Kemenag Tunggu Keputusan Saudi",
      "waktu": "Baru saja",
      "gambar": "assets/images/berita1.png",
      "url":
          "https://www.suarasurabaya.net/kelanakota/2025/kuota-haji-2026-diumumkan-10-juli-2025-kemenag-tunggu-keputusan-saudi/"
    },
    {
      "judul":
          "Perluasan Tahap Ketiga Masjidil Haram: Area Luas, Fasilitas Meningkat",
      "waktu": "Baru saja",
      "gambar": "assets/images/berita2.png",
      "url":
          "https://www.nu.or.id/internasional/perluasan-tahap-ketiga-masjidil-haram-selesai-bisa-tampung-3-juta-orang-4DZ4y"
    },
    {
      "judul":
          "Paviliun Bandara Jeddah, Ruang Singgah Jamaah Haji Penuh Cerita",
      "waktu": "Baru saja",
      "gambar": "assets/images/berita4.png",
      "url":
          "https://rm.id/baca-berita/humaniora/266921/kabar-dari-tanah-suci-paviliun-bandara-jeddah-ruang-singgah-jemaah-haji-penuh-cerita"
    },
  ];

  // ==============================
  // DATA UPDATE TERKINI
  // ==============================
  final List<Map<String, dynamic>> updateTerkini = [
    {
      "judul": "Bandara King Abdulaziz Buka Terminal Khusus Jemaah",
      "waktu": "5 jam yang lalu",
      "gambar": "assets/images/bandara.png",
      "url": "https://saudigazette.com.sa/article/634565"
    },
    {
      "judul": "Aplikasi Nusuk Hadirkan Fitur Pembayaran Digital",
      "waktu": "12 jam yang lalu",
      "gambar": "assets/images/aplikasi_nusuk.png",
      "url": "https://www.example.com/aplikasi-nusuk"
    },
    {
      "judul": "Prakiraan Cuaca Mekkah dan Madinah Minggu Ini",
      "waktu": "1 hari yang lalu",
      "gambar": "assets/images/cuaca.png",
      "url": "https://www.example.com/cuaca-mekkah"
    },
  ];

  // ==============================
  // FUNGSI MEMBUKA URL DI BROWSER
  // ==============================
  Future<void> _bukaUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // ==============================
  // WIDGET UNTUK KARTU BERITA
  // ==============================
  Widget _buildBeritaCard(Map<String, dynamic> berita) {
    return GestureDetector(
      onTap: () => _bukaUrl(berita["url"]),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Berita
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: berita["gambar"].toString().startsWith("http")
                  ? Image.network(
                      berita["gambar"],
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      berita["gambar"],
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            // Bagian teks berita
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    berita["judul"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  if (berita.containsKey("deskripsi"))
                    Text(
                      berita["deskripsi"],
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black54),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    berita["waktu"],
                    style:
                        const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ==============================
  // WIDGET UNTUK MEMBUAT SECTION
  // ==============================
  Widget _buildSection(String title, List<Map<String, dynamic>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: data.map((e) => _buildBeritaCard(e)).toList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==============================
      // HEADER KUSTOM (MIRIP GAMBAR)
      // ==============================
      appBar: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false, // Supaya tidak ada icon back default
        title: Row(
          children: [
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0), // supaya icon tidak mepet
                child: Image.asset(
                  'assets/icons/iconback.png', // pastikan ada di assets
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "Berita Umrah & Haji",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),


      // ==============================
      // ISI HALAMAN
      // ==============================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBeritaCard(beritaUtama[0]),
            _buildSection("Berita Terbaru", beritaUtama),
            _buildSection("Update Terkini", updateTerkini),
          ],
        ),
      ),
    );
  }
}
