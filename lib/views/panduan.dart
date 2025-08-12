import 'package:flutter/material.dart';

class Panduan extends StatefulWidget {
  const Panduan({super.key});

  @override
  State<Panduan> createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> {
  int selectedTab = 0; // 0: Panduan, 1: Doa

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Warna untuk tab
    final Color activeTabColor = const Color(0xFFD4AF37);
    final Color inactiveTabColor = Colors.white;
    final Color activeTextColor = const Color(0xFF1B3557);
    final Color inactiveTextColor = Colors.black54;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3E9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Blue Gradient
            Container(
              width: double.infinity,
              height: 90,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1B3557), Color(0xFF3A7BD5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Panduan Ibadah",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Umrah & Haji",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Tab Panduan & Doa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Tab Panduan
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 0;
                          });
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient:
                                selectedTab == 0
                                    ? const LinearGradient(
                                      colors: [
                                        Color(0xFFD4AF37),
                                        Color(0xFFF6E7B4),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    )
                                    : null,
                            color: selectedTab == 0 ? null : inactiveTabColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/panduan2.png',
                                width: 24,
                                height: 24,
                                color:
                                    selectedTab == 0
                                        ? activeTextColor
                                        : inactiveTextColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Panduan",
                                style: TextStyle(
                                  color:
                                      selectedTab == 0
                                          ? activeTextColor
                                          : inactiveTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Tab Doa
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 1;
                          });
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient:
                                selectedTab == 1
                                    ? const LinearGradient(
                                      colors: [
                                        Color(0xFFD4AF37),
                                        Color(0xFFF6E7B4),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    )
                                    : null,
                            color: selectedTab == 1 ? null : inactiveTabColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.self_improvement,
                                color:
                                    selectedTab == 1
                                        ? activeTextColor
                                        : inactiveTextColor,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Doa",
                                style: TextStyle(
                                  color:
                                      selectedTab == 1
                                          ? activeTextColor
                                          : inactiveTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Content
            if (selectedTab == 0) ...[
              // Label Panduan Umrah
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: const [
                    Text(
                      "Panduan Umrah",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1B3557),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Langkah-langkah Umrah
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    _PanduanBox(
                      number: 1,
                      title: "Niat Umrah & Ihram",
                      desc: "Berniat umrah di miqat, talbiyah",
                      icon: Image.asset(
                        'assets/icons/kaabah.png',
                        width: 20,
                        height: 20,
                        color: const Color(0xFF1B3557),
                      ),
                      iconColor: const Color(0xFF1B3557),
                      numberBg: const Color(0xFFD4AF37),
                      titleColor: const Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 2,
                      title: "Tawaf",
                      desc: "Mengelilingi Ka'bah 7 kali",
                      icon:  Icon(Icons.account_balance), // Ganti dengan asset nanti
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 3,
                      title: "Shalat Sunnah di Maqam Ibrahim",
                      desc: "Shalat 2 rakaat",
                      icon: Icon(Icons.mosque), // Ganti dengan asset nanti
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 4,
                      title: "Minum Air Zamzam",
                      desc: "Minum sambil berdoa",
                      icon: Icon(Icons.water_drop), // Ganti dengan asset nanti
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 5,
                      title: "Sa'i",
                      desc: "Berjalan 7 kali Shafa-Marwah",
                      icon: Icon(Icons.directions_walk), // Ganti dengan asset nanti
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 6,
                      title: "Tahallul",
                      desc:
                          "Memotong atau mencukur rambut sebagai tanda selesainya umrah",
                      icon:
                          Icon(Icons.content_cut), // Ganti icon dengan asset jika ada
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 7,
                      title: "Selesai",
                      desc:
                          "Umrah selesai, ibadah dapat dilanjutkan dengan amalan sunnah lainnya",
                      icon: Icon(Icons.check_circle_outline),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Label Panduan Haji
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: const [
                    Text(
                      "Panduan Haji",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFD4AF37),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Langkah-langkah Haji
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    _PanduanBox(
                      number: 1,
                      title: "Niat Haji & Ihram",
                      desc: "Berniat haji di miqat, talbiyah",
                      icon: Icon(Icons.groups),
                      iconColor: Color(0xFFFD4AF37),
                      numberBg: Color(0xFFFD4AF37),
                      titleColor: Color(0xFFFD4AF37),
                    ),
                    _PanduanBox(
                      number: 2,
                      title: "Wukuf di Arafah",
                      desc:
                          "Berdiam, berdoa, dan berzikir di Padang Arafah pada 9 Dzulhijjah",
                      icon: Icon(Icons.landscape),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 3,
                      title: "Mabit di Muzdalifah",
                      desc:
                          "Menginap di Muzdalifah dan mengumpulkan batu untuk jumrah",
                      icon: Icon(Icons.nights_stay),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 4,
                      title: "Melempar Jumrah Aqabah",
                      desc:
                          "Melempar 7 batu kerikil ke Jumrah Aqabah pada 10 Dzulhijjah",
                      icon: Icon(Icons.sports_baseball),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 5,
                      title: "Penyembelihan Hewan",
                      desc: "Menyembelih hewan kurban (bagi yang wajib)",
                      icon: Icon(Icons.set_meal),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 6,
                      title: "Tahallul Awal",
                      desc:
                          "Mencukur atau memotong rambut, sebagian larangan ihram sudah boleh",
                      icon: Icon(Icons.content_cut),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 7,
                      title: "Tawaf Ifadah",
                      desc:
                          "Mengelilingi Ka'bah 7 kali, dilanjutkan dengan Sa’i",
                      icon: Icon(Icons.account_balance),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 8,
                      title: "Mabit di Mina",
                      desc: "Menginap di Mina pada hari Tasyriq",
                      icon: Icon(Icons.hotel),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 9,
                      title: "Melempar Tiga Jumrah",
                      desc:
                          "Melempar Jumrah Ula, Wustha, dan Aqabah di hari Tasyriq",
                      icon: Icon(Icons.sports),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                    _PanduanBox(
                      number: 10,
                      title: "Tawaf Wada",
                      desc: "Tawaf perpisahan sebelum meninggalkan Mekkah",
                      icon: Icon(Icons.airplane_ticket),
                      iconColor: Color(0xFFD4AF37),
                      numberBg: Color(0xFFD4AF37),
                      titleColor: Color(0xFF1B3557),
                    ),
                  ],
                ),
              ),
            ] else ...[
              // Doa Page
              // ...masukkan widget page doa di sini...
            ],
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Widget untuk box panduan
class _PanduanBox extends StatelessWidget {
  final int number;
  final String title;
  final String desc;
  final Widget icon;
  final Color iconColor;
  final Color numberBg;
  final Color titleColor;

  const _PanduanBox({
    required this.number,
    required this.title,
    required this.desc,
    required this.icon,
    required this.iconColor,
    required this.numberBg,
    required this.titleColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Number Circle
          CircleAvatar(
            backgroundColor: numberBg,
            radius: 18,
            child: Text(
              "$number",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Icon
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.12),
            radius: 18,
            child: icon,
          ),
        ],
      ),
    );
  }
}