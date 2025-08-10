import 'package:flutter/material.dart';
import 'package:tridaya_travel/views/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  // Dummy data for FAQ
  final List<Map<String, dynamic>> _faqItems = [
    {
      'icon': 'assets/icons/if1.png',
      'question': 'Apa saja syarat umroh?',
      'answer': '''
                1. Fotocopy KTP/SIM
                2. Fotocopy Kartu Keluarga
                3. Fotocopy BPJS/ASKES
                4. Paspor Asli
                5. Sertifikat Vaksin Meningitis
                6. Sertifika Vaksin Polio
                7. Pas Foto 4x6 Background Putih 3 Lembar
                ''',
    },
    {
      'icon': 'assets/icons/if2.png',
      'question': 'Kapan jadwal keberangkatan?',
      'answer':
          'Jadwal keberangkatan ditentukan berdasarkan paket umrah yang Anda pilih dan daerah pembelian. Untuk informasi jadwal terbaru, silakan cek akun Instagram resmi kami: @tridayatravelsumsel (khusus Sumatera Selatan).',
    },
    {
      'icon': 'assets/icons/if3.png',
      'question': 'Apa saja metode pembayaran?',
      'answer':
          'untuk metode pembayaran bisa dengan cash atau via transfer bank Mandiri dan BSI',
    },
    {
      'icon': 'assets/icons/if4.png',
      'question': 'Pesawat apa yang biasanya digunakan?',
      'answer': 'Pesawat Lion, Pesawat Garuda, Pesawat Citilink.',
    },
    {
      'icon': 'assets/icons/if5.png',
      'question': 'Bagaimana dengan layanan konsultasi?',
      'answer': 'Jawaban untuk layanan konsultasi...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FAQ',
          style: TextStyle(
            color: Color(0xFFFFFFFF), // White color
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFFFFF), // White color
          ),
          onPressed: () {
            // Navigate back to the home page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
        backgroundColor: const Color(0xFF1E40AF), // Using a dark blue color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FAQ Icon and Title
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color.fromARGB(255, 236, 247, 255),
                    child: Icon(
                      Icons.question_mark,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pertanyaan yang Sering Diajukan',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Temukan jawaban untuk pertanyaan umum seputar layanan haji dan umroh kami',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // List of FAQ items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _faqItems.length,
              itemBuilder: (context, index) {
                final item = _faqItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ExpansionTile(
                    leading: ImageIcon(
                      AssetImage(item['icon'] as String),
                      size: 35, // Adjust size as needed
                      color:
                          Theme.of(
                            context,
                          ).colorScheme.primary, // Use theme primary color
                    ),
                    title: Text(
                      item['question'] as String,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          item['answer'] as String,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // Contact Us Section
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      'assets/images/faq.png', // Your image asset
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150, // Adjust height as needed
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Changed to center
                      children: [
                        Text(
                          'Masih ada pertanyaan? Tim kami siap membantu Anda',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF1E40AF), // Dark blue
                                Color(0xFF3B82F6), // A lighter blue
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const ImageIcon(
                                      // Changed to ImageIcon
                                      AssetImage(
                                        'assets/icons/bubble.png',
                                      ), // Path to your bubble icon
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Butuh Bantuan Lebih Lanjut?',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Hubungi tim customer service kami',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white70),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        final phone = '6282164462940';
                                        final message = Uri.encodeComponent(
                                          'assallamualaikum warahmatullahi wabarakatuh/salam',
                                        );
                                        final url =
                                            'https://wa.me/$phone?text=$message';
                                        if (await canLaunchUrl(
                                          Uri.parse(url),
                                        )) {
                                          await launchUrl(
                                            Uri.parse(url),
                                            mode:
                                                LaunchMode.externalApplication,
                                          );
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Tidak dapat membuka WhatsApp',
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      icon: ImageIcon(
                                        const AssetImage('assets/icons/wa.png'),
                                        size: 24,
                                        color: Colors.green,
                                      ),
                                      label: const Text('Chat WhatsApp'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
