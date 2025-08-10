import 'package:flutter/material.dart';
import 'package:tridaya_travel/widgets/textview.dart';

class PaketUmrah extends StatefulWidget {
  const PaketUmrah({super.key});

  @override
  State<PaketUmrah> createState() => _PaketUmrahState();
}

class _PaketUmrahState extends State<PaketUmrah> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Container(
                color: Color(0xFF242D3A), // Set background color here
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFF4C95D), // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pp.png'),
                        radius: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textView(
                          EdgeInsets.zero,
                          'Muhammad Fathir Alfarici',
                          TextAlign.left,
                          const Color.fromARGB(255, 255, 255, 255),
                          FontWeight.bold,
                          16.0,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color(0xFFF4C95D),
                              size: 15,
                            ),
                            textView(
                              EdgeInsets.zero,
                              'Palembang, Indonesia',
                              TextAlign.left,
                              Color(0xFFF4C95D),
                              FontWeight.normal,
                              12.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Paket Umrah Title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: textView(
                  EdgeInsets.zero,
                  'Paket Umrah',
                  TextAlign.left,
                  Colors.black,
                  FontWeight.bold,
                  24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: textView(
                  EdgeInsets.zero,
                  'Pilih paket umrah terbaik untuk perjalanan ibadah Anda',
                  TextAlign.left,
                  Colors.black87,
                  FontWeight.normal,
                  14.0,
                ),
              ),

              // Rekomendasi Paket Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: textView(
                  EdgeInsets.zero,
                  'Rekomendasi Paket',
                  TextAlign.left,
                  Colors.black,
                  FontWeight.bold,
                  18.0,
                ),
              ),
             SizedBox(
                height: 288,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 16),
                    _buildUmrahPackageCard(
                      'assets/images/paketirit.png', // Image path for Umrah Irit
                      'Umrah Irit',
                      'Rp 28.900.000/orang',
                      const Color(0xFF1E293B),
                      const Color(0xFF1E40AF),
                      const Color.fromARGB(255, 255, 255, 255),
                      const Color(0xFFF4C95D),
                      const Color(0xFF242D3A), // Text color for button
                      const Color(0xFFF4C95D), // Button color
                    ),
                    const SizedBox(width: 16),
                    _buildUmrahPackageCard(
                      'assets/images/paketelit.png', // Corrected Image path for Umrah Elit
                      'Umrah Elit',
                      'Rp 33.500.000/orang',
                      const Color(0xFFFAD961),
                      const Color(0xFFFBC02D),
                      const Color(0xFF242D3A),
                      const Color(0xFF242D3A),
                      const Color(0xFFFFFFFF),  // Text color for button
                      const Color(0xFF242D3A), // Button color
                    ),
                    const SizedBox(width: 16),
                    // Add more package cards as needed
                  ],
                ),
              ),


              // Jadwal Keberangkatan Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: textView(
                  EdgeInsets.zero,
                  'Jadwal Keberangkatan',
                  TextAlign.left,
                  Colors.black,
                  FontWeight.bold,
                  18.0,
                ),
              ),
              _buildDepartureScheduleCard(
                'Agustus 2025',
                [
                  {
                    'packageName': 'Umrah Reguler',
                    'facilities': 'Semua slot telah terisi',
                    'priceStatus': 'PENUH',
                  },
                ],
                const Color(0xFFF0F0F0),
                Colors.black,
                false,
              ),
              _buildDepartureScheduleCard(
                'September 2025',
                [
                  {
                    'packageName': 'Umrah Irit',
                    'facilities':
                        'Hotel: Madinah Jawharat Alrasheed, Makkah Rehab Al Taqwa',
                    'priceStatus': 'Rp. 28.900.000',
                  },
                  {
                    'packageName': 'Umrah Elit',
                    'facilities':
                        'Hotel: Madinah Jawharat Alrasheed, Makkah Makkah Tower',
                    'priceStatus': 'Rp. 33.500.000',
                  },
                ],
                const Color(0xFFF0F0F0),
                Colors.black,
                true,
              ),
              _buildDepartureScheduleCard(
                'Oktober 2025',
                [
                  {
                    'packageName': 'Umrah Reguler',
                    'facilities': 'fasilitas, jadwal, hotel sama',
                    'priceStatus': 'Rp. 32.500.000',
                  },
                ],
                const Color(0xFF242D3A),
                Colors.white,
                true,
              ),
              _buildDepartureScheduleCard(
                'November 2025',
                [
                  {
                    'packageName': 'Umrah Reguler',
                    'facilities': 'fasilitas, jadwal, hotel sama',
                    'priceStatus': 'Rp. 32.500.000',
                  },
                ],
                const Color(0xFF242D3A),
                Colors.white,
                true,
              ),
              _buildDepartureScheduleCard(
                'Desember 2025',
                [
                  {
                    'packageName': 'Umrah Reguler',
                    'facilities': 'fasilitas, jadwal, hotel sama',
                    'priceStatus': 'Rp. 32.500.000',
                  },
                ],
                const Color(0xFF242D3A),
                Colors.white,
                true,
              ),

              // Harga Sudah Termasuk Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: textView(
                  EdgeInsets.zero,
                  'Harga Sudah Termasuk',
                  TextAlign.left,
                  Colors.black,
                  FontWeight.bold,
                  18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIncludedItem(
                            Icons.airplane_ticket,
                            'Tiket pesawat PP',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.hotel,
                            'Hotel & akomodasi',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.directions_bus,
                            'Bus AC',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.card_travel,
                            'Manasik Umrah',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.local_drink,
                            'Air Zamzam 5 liter (tentative)',
                            Colors.black54,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildIncludedItem(
                            Icons.card_membership,
                            'Visa Umrah',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.fastfood,
                            'Makan 3x sehari',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.shopping_bag,
                            'Perlengkapan "REG"',
                            Colors.black54,
                          ),
                          _buildIncludedItem(
                            Icons.person,
                            'Mutowwif & pembimbing',
                            Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

    Widget _buildUmrahPackageCard(
    String imageAsset,
    String packageName,
    String price,
    Color gradientColor1,
    Color gradientColor2,
    Color packageNameColor,
    Color priceColor,
    Color buttonTextColor, // New parameter for button text color
    Color buttonColor,
  ) {
    return Container(
      width: 280,
      height: 288,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [gradientColor1, gradientColor2],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
              bottom: Radius.circular(10),
            ),
            child: Image.asset(
              imageAsset,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textView(
              EdgeInsets.zero,
              packageName,
              TextAlign.left,
              packageNameColor,
              FontWeight.bold,
              16.0,
            ), // Use packageNameColor here
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: textView(
              EdgeInsets.zero,
              price,
              TextAlign.left,
              priceColor,
              FontWeight.bold,
              14.0,
            ), // Make price bold and use priceColor
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: Size(
                  double.infinity,
                  40,
                ), // Make the button full width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // Increased border radius
                ),
              ),
              child: textView(
                EdgeInsets.zero,
                'Lihat Detail',
                TextAlign.center,
                buttonTextColor, // Use the new parameter for text color
                FontWeight.bold,
                14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDepartureScheduleCard(
    String monthYear,
    List<Map<String, String>> packages,
    Color backgroundColor,
    Color textColor,
    bool showButton,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textView(
            EdgeInsets.zero,
            monthYear,
            TextAlign.left,
            textColor,
            FontWeight.bold,
            16.0,
          ),
          const SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final package = packages[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 40,
                      color: const Color(0xFFFBC02D),
                      margin: const EdgeInsets.only(right: 8.0),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textView(
                            EdgeInsets.zero,
                            package['packageName']!,
                            TextAlign.left,
                            textColor.withOpacity(0.8),
                            FontWeight.bold,
                            14.0,
                          ),
                          textView(
                            EdgeInsets.zero,
                            package['facilities']!,
                            TextAlign.left,
                            textColor.withOpacity(0.6),
                            FontWeight.normal,
                            12.0,
                          ),
                        ],
                      ),
                    ),
                    textView(
                      EdgeInsets.zero,
                      package['priceStatus']!,
                      TextAlign.right,
                      package['priceStatus'] == 'PENUH'
                          ? Colors.red
                          : Color(0xFFF4C95D),
                      FontWeight.bold,
                      14.0,
                    ),
                  ],
                ),
              );
            },
          ),

          if (showButton)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFAD961),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: textView(
                  EdgeInsets.zero,
                  "Check Paket Umroh",
                  TextAlign.center,
                  Colors.black87,
                  FontWeight.bold,
                  14.0,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIncludedItem(IconData icon, String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: textView(
              EdgeInsets.zero,
              text,
              TextAlign.left,
              textColor,
              FontWeight.normal,
              14.0,
            ),
          ),
        ],
      ),
    );
  }
}