import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart'; // Tambahan untuk buka WA

class Detailpaket extends StatefulWidget {
  const Detailpaket({super.key});

  @override
  State<Detailpaket> createState() => _DetailpaketState();
}

class _DetailpaketState extends State<Detailpaket> {
  final String packageName = 'Umrah Reguler';
  final String packageDate = '09 Desember 2025';
  final double packagePriceValue = 35500000;
  final String packageDuration = '12 Hari';

  final List<Map<String, dynamic>> facilities = [
    {'icon': Icons.hotel, 'text': 'Hotel Bintang 3 di Madinah & Makkah'},
    {'icon': Icons.restaurant, 'text': 'Makan 3x sehari'},
    {'icon': Icons.card_travel, 'text': 'Visa Umrah'},
    {'icon': Icons.airplane_ticket, 'text': 'Tiket pesawat PP'},
    {'icon': Icons.directions_bus, 'text': 'Bus AC antar kota'},
    {
      'icon': Icons.card_giftcard,
      'text': 'Perlengkapan Umrah (sarung, kain ihram, tas, dll)',
    },
    {'icon': Icons.local_drink, 'text': 'Air Zamzam 5L (tentatif)'},
    {'icon': Icons.person, 'text': 'Pembimbing & Mutawwif'},
    {'icon': Icons.book, 'text': 'Manasik Umrah sebelum keberangkatan'},
  ];

  int _quantity = 1;

  double _calculateTotalPrice() {
    return _quantity * packagePriceValue;
  }

  String _formatCurrency(double value) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  // Fungsi untuk kirim pesan ke WhatsApp
  void _orderViaWhatsApp() async {
    final String phone = "628117891993";
    final String message =
        "Halo, saya ingin memesan paket $packageName untuk $_quantity orang pada tanggal $packageDate. Total harga: ${_formatCurrency(_calculateTotalPrice())}.";
    final Uri url = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4584),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Paket',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/detailpaket.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    packageName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E4584),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        packageDate,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          packageDuration,
                          style: TextStyle(
                            color: Colors.orange.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_formatCurrency(packagePriceValue)} / orang',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Fasilitas Unggulan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...facilities.map(
                    (facility) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(facility['icon'], color: Colors.orange),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              facility['text'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pemesanan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Jumlah Orang', style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          if (_quantity > 1) {
                            setState(() => _quantity--);
                          }
                        },
                      ),
                      Text(
                        '$_quantity',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () {
                          setState(() => _quantity++);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Harga:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        _formatCurrency(_calculateTotalPrice()),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E4584),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Image.asset(
                        'assets/icons/wa.png',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E4584),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _orderViaWhatsApp,
                      label: const Text(
                        'Pesan Sekarang',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
