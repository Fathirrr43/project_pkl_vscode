import 'package:flutter/material.dart';
import 'package:tridaya_travel/widgets/textview.dart';
import 'package:url_launcher/url_launcher.dart';


class Keberangkatan extends StatelessWidget {
  const Keberangkatan({super.key});

  @override
  Widget build(BuildContext context) {
    final Color blue = const Color(0xFF2341A0);

   return Scaffold(
  backgroundColor: const Color(0xFFF6F8FB),
appBar: AppBar(
  backgroundColor: const Color(0xFF2341A0),
  title: textView(
    EdgeInsets.zero,
    "Keberangkatan Saya",
    TextAlign.center,
    Colors.white,
    FontWeight.bold,
    18.0,
  ),
  centerTitle: true,
  elevation: 0,
),
  body: SafeArea(
    child: Center(
      child: SingleChildScrollView(
        child: Container(
          width: 370,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Card Paket
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2341A0), Color(0xFF3A7BD5)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.15),
                          child: Image.asset(
                            'assets/icons/kaabah.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textView(
                              EdgeInsets.zero,
                              "Umrah 9 Hari",
                              TextAlign.left,
                              Colors.white,
                              FontWeight.bold,
                              16.0,
                            ),
                            const SizedBox(height: 2),
                            textView(
                              EdgeInsets.zero,
                              "Paket Elit",
                              TextAlign.left,
                              const Color(0xFFD6E4FF),
                              FontWeight.normal,
                              13.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textView(
                          EdgeInsets.zero,
                          "Status Pembayaran",
                          TextAlign.left,
                          Colors.white,
                          FontWeight.normal,
                          13.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/lunas.png',
                                width: 16,
                                height: 16,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 4),
                              textView(
                                EdgeInsets.zero,
                                "Lunas",
                                TextAlign.left,
                                Colors.green,
                                FontWeight.bold,
                                13.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Info Cards
              _InfoCard(
                icon: 'assets/icons/berangkat.png',
                title: "Tanggal Keberangkatan",
                subtitle: "Kamis, 11 September 2025",
                trailing: "08:30 WIB",
              ),
              const SizedBox(height: 16),
              _InfoCard(
                icon: 'assets/icons/pulang.png',
                title: "Tanggal Kepulangan",
                subtitle: "Sabtu, 20 September 2025",
                trailing: "14:45 WIB",
              ),
              const SizedBox(height: 16),
              _InfoCard(
                icon: 'assets/icons/tanda.png',
                title: "Meeting Point",
                subtitle: "Bandara Mahmud Badarrudin II",
                trailing: "Datang 1 jam sebelum keberangkatan",
                trailingStyle: const TextStyle(
                  color: Color(0xFF2341A0),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              // Important Info
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFE082)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.orange,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: textView(
                        EdgeInsets.zero,
                        "Pastikan dokumen perjalanan (paspor, visa) sudah siap dan berlaku minimal 6 bulan.",
                        TextAlign.left,
                        const Color(0xFFB28704),
                        FontWeight.w500,
                        13.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Bantuan
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textView(
                      EdgeInsets.zero,
                      "Butuh Bantuan?",
                      TextAlign.center,
                      const Color(0xFF2341A0),
                      FontWeight.bold,
                      14.0,
                    ),
                    const SizedBox(height: 8),
                    textView(
                      EdgeInsets.zero,
                      "Tim customer service kami siap membantu Anda",
                      TextAlign.center,
                      Colors.black87,
                      FontWeight.normal,
                      13.0,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                final Uri waUrl = Uri.parse("https://wa.me/628117891993"); // ubah 081 jadi 62
                                if (await canLaunchUrl(waUrl)) {
                                  await launchUrl(waUrl, mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Tidak dapat membuka WhatsApp';
                                }
                              },
                              icon: Image.asset(
                                'assets/icons/wa.png',
                                width: 18,
                                height: 18,
                                color: Colors.white,
                              ),
                              label: textView(
                                EdgeInsets.zero,
                                "Hubungi WhatsApp",
                                TextAlign.center,
                                Colors.white,
                                FontWeight.bold,
                                13.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String trailing;
  final TextStyle? trailingStyle;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.trailingStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F8FB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(icon, width: 24, height: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textView(
                  EdgeInsets.zero,
                  title,
                  TextAlign.left,
                  const Color(0xFF2341A0),
                  FontWeight.bold,
                  14.0,
                ),
                const SizedBox(height: 2),
                textView(
                  EdgeInsets.zero,
                  subtitle,
                  TextAlign.left,
                  Colors.black87,
                  FontWeight.normal,
                  13.0,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: textView(
              EdgeInsets.zero,
              trailing,
              TextAlign.right,
              trailingStyle?.color ?? Colors.black54,
              trailingStyle?.fontWeight ?? FontWeight.normal,
              trailingStyle?.fontSize ?? 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
