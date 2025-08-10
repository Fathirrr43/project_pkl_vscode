import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LokasiCabang extends StatefulWidget {
  const LokasiCabang({super.key});

  @override
  State<LokasiCabang> createState() => _LokasiCabangState();
}

class _LokasiCabangState extends State<LokasiCabang> {
  // Data for branch locations, now with Google Maps links
  final List<Map<String, dynamic>> _branchLocations = [
    {
      'name': 'Tridaya Tour & Travel Padang',
      'address':
          'Jl. S. Parman No.90d, Lolong Belanti, Kec. Padang Utara, Kota Padang, Sumatera Barat 25136',
      'phone': '0811660678',
      'mapsUrl': 'https://maps.app.goo.gl/vcVpwvRmZCq3Akcy7',
    },
    {
      'name': 'Tridaya Tour & Travel Riau',
      'address':
          '9432+C88, Air Tiris, Kec. Kampar, Kabupaten Kampar, Riau 28463',
      'phone': '088271315654',
      'mapsUrl': 'https://maps.app.goo.gl/EPLJkP11qTVywAJMA',
    },
    {
      'name': 'Tridaya Tour & Travel Jambi',
      'address':
          'Jl. Slamet Riyadi No.140, Solok Sipin, Kec. Telanaipura, Kota Jambi, Jambi 36124i',
      'phone': '082279119974',
      'mapsUrl': 'https://maps.app.goo.gl/2gZRu9S6J8VAhPUP6',
    },
    {
      'name': 'Tridaya Tour & Travel Palembang',
      'address':
          'Jl. Parameswara, RT.03/RW.01, Bukit Baru, Kec. Ilir Bar. I, Kota Palembang, Sumatera Selatan 30138 (2P7F+59)',
      'phone': '08117891993',
      'mapsUrl': 'https://maps.app.goo.gl/2Aqv1FGp51AtHgnZ6',
    },
  ];

  // Fungsi untuk meluncurkan peta dengan url yang diberikan
  void _launchMap(String url) async {
    final Uri googleMapsUrl = Uri.parse(url);
    if (!await launchUrl(googleMapsUrl)) {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lokasi Cabang')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Temukan Cabang Terdekat section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color.fromARGB(255, 236, 247, 255),
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Temukan Cabang Terdekat',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kunjungi kantor cabang kami untuk konsultasi langsung',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // Branch locations list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _branchLocations.length,
              itemBuilder: (context, index) {
                final branch = _branchLocations[index];
                return BranchCard(
                  name: branch['name'],
                  address: branch['address'],
                  phone: branch['phone'],
                  mapsUrl: branch['mapsUrl'],
                  onMapTap: () {
                    _launchMap(branch['mapsUrl']);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for Branch Card
class BranchCard extends StatelessWidget {
  final String name;
  final String address;
  final String phone;
  final String mapsUrl;
  final VoidCallback onMapTap;

  const BranchCard({
    Key? key,
    required this.name,
    required this.address,
    required this.phone,
    required this.mapsUrl,
    required this.onMapTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 18, color: Color(0xff2563EB)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    address,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.call, size: 18, color: Color(0xff2563EB)),
                const SizedBox(width: 8),
                Text(
                  phone,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onMapTap,
              icon: const Icon(Icons.map),
              label: const Text('Lihat di Maps'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
