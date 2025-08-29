import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Panduan extends StatefulWidget {
  const Panduan({super.key});

  @override
  State<Panduan> createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> doaList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fetchDoa();
  }

  Future<void> fetchDoa() async {
    final response = await http.get(
      Uri.parse(
        "https://689ca29758a27b18087eea08.mockapi.io/doa",
      ), // url MockAPI tab doa
    );
    if (response.statusCode == 200) {
      setState(() {
        doaList = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: const [
                Text(
                  "Panduan Ibadah",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Umrah & Haji",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= CUSTOM TAB =================
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // TAB PANDUAN
                Expanded(
                  child: GestureDetector(
                    onTap: () => _tabController.animateTo(0),
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (context, _) {
                        final isSelected = _tabController.index == 0;
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient:
                                isSelected
                                    ? const LinearGradient(
                                      colors: [
                                        Color(0xFFD4AF37),
                                        Color(0xFFF1E6B2),
                                      ],
                                    )
                                    : null,
                            color: isSelected ? null : Colors.white,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.menu_book,
                                color: isSelected ? Colors.black : Colors.grey,
                              ),
                              Text(
                                "Panduan",
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // TAB DOA
                Expanded(
                  child: GestureDetector(
                    onTap: () => _tabController.animateTo(1),
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (context, _) {
                        final isSelected = _tabController.index == 1;
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient:
                                isSelected
                                    ? const LinearGradient(
                                      colors: [
                                        Color(0xFFD4AF37),
                                        Color(0xFFF1E6B2),
                                      ],
                                    )
                                    : null,
                            color: isSelected ? null : Colors.white,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.self_improvement,
                                color: isSelected ? Colors.black : Colors.grey,
                              ),
                              Text(
                                "Doa",
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ===== ISI TAB =====
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // TAB PANDUAN
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "Panduan Umrah",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFD4AF37),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

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
                              icon: const Icon(Icons.account_balance),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 3,
                              title: "Shalat Sunnah di Maqam Ibrahim",
                              desc: "Shalat 2 rakaat",
                              icon: const Icon(Icons.mosque),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 4,
                              title: "Minum Air Zamzam",
                              desc: "Minum sambil berdoa",
                              icon: const Icon(Icons.water_drop),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 5,
                              title: "Sa'i",
                              desc: "Berjalan 7 kali Shafa-Marwah",
                              icon: const Icon(Icons.directions_walk),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 6,
                              title: "Tahallul",
                              desc:
                                  "Memotong atau mencukur rambut sebagai tanda selesainya umrah",
                              icon: const Icon(Icons.content_cut),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 7,
                              title: "Selesai",
                              desc:
                                  "Umrah selesai, ibadah dapat dilanjutkan dengan amalan sunnah lainnya",
                              icon: const Icon(Icons.check_circle_outline),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "Panduan Haji",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFD4AF37),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            _PanduanBox(
                              number: 1,
                              title: "Niat Haji & Ihram",
                              desc: "Berniat haji di miqat, talbiyah",
                              icon: const Icon(Icons.groups),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 2,
                              title: "Wukuf di Arafah",
                              desc:
                                  "Berdiam, berdoa, dan berzikir di Padang Arafah pada 9 Dzulhijjah",
                              icon: const Icon(Icons.landscape),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 3,
                              title: "Mabit di Muzdalifah",
                              desc:
                                  "Menginap di Muzdalifah dan mengumpulkan batu untuk jumrah",
                              icon: const Icon(Icons.nights_stay),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 4,
                              title: "Melempar Jumrah Aqabah",
                              desc:
                                  "Melempar 7 batu kerikil ke Jumrah Aqabah pada 10 Dzulhijjah",
                              icon: const Icon(Icons.sports_baseball),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 5,
                              title: "Penyembelihan Hewan",
                              desc:
                                  "Menyembelih hewan kurban (bagi yang wajib)",
                              icon: const Icon(Icons.set_meal),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 6,
                              title: "Tahallul Awal",
                              desc:
                                  "Mencukur atau memotong rambut, sebagian larangan ihram sudah boleh",
                              icon: const Icon(Icons.content_cut),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 7,
                              title: "Tawaf Ifadah",
                              desc:
                                  "Mengelilingi Ka'bah 7 kali, dilanjutkan dengan Sa’i",
                              icon: const Icon(Icons.account_balance),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 8,
                              title: "Mabit di Mina",
                              desc: "Menginap di Mina pada hari Tasyriq",
                              icon: const Icon(Icons.hotel),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 9,
                              title: "Melempar Tiga Jumrah",
                              desc:
                                  "Melempar Jumrah Ula, Wustha, dan Aqabah di hari Tasyriq",
                              icon: const Icon(Icons.sports),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                            _PanduanBox(
                              number: 10,
                              title: "Tawaf Wada",
                              desc:
                                  "Tawaf perpisahan sebelum meninggalkan Mekkah",
                              icon: const Icon(Icons.airplane_ticket),
                              iconColor: const Color(0xFFD4AF37),
                              numberBg: const Color(0xFFD4AF37),
                              titleColor: const Color(0xFF1B3557),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // TAB DOA (data dari API)
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: doaList.length,
                      itemBuilder: (context, index) {
                        final doa = doaList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              doa['title'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B3557),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Text(
                                  doa['arabic'] ?? '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  doa['latin'] ?? '',
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(doa['arti'] ?? ''),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
              ],
            ),
          ),
        ],
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
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: numberBg,
          child: Text(
            number.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: titleColor),
        ),
        subtitle: Text(desc),
        trailing: icon,
      ),
    );
  }
}
