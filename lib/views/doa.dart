import 'package:flutter/material.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B3557),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Doa-Doa Ibadah",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          children: const [
            _DoaCard(
              title: "Doa Niat Umrah",
              arabic: "اللَّهُمَّ لَبَّيْكَ عُمْرَةً",
              latin: "Allahumma labbaika ‘umrah.",
              arti: "Ya Allah, aku penuhi panggilan-Mu untuk berumrah.",
              icon: Icons.wallet_giftcard,
            ),
            _DoaCard(
              title: "Talbiyah",
              arabic:
                  "لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ، إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ",
              latin:
                  "Labbaika Allahumma labbaik, labbaika laa syarika laka labbaik, innal hamda wan-ni’mata laka wal-mulk, laa syarika lak.",
              arti:
                  "Aku penuhi panggilan-Mu ya Allah, tiada sekutu bagi-Mu; segala puji, nikmat, dan kerajaan adalah milik-Mu, tiada sekutu bagi-Mu.",
              icon: Icons.favorite,
              isFavorite: true,
            ),
            _DoaCard(
              title: "Doa Tawaf",
              arabic:
                  "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
              latin:
                  "Rabbanaa aatinaa fid-dunyaa hasanah, wa fil-aakhirati hasanah, wa qinaa ‘adzaaban-naar.",
              arti:
                  "Ya Tuhan kami, berikanlah kami kebaikan di dunia dan di akhirat, dan lindungilah kami dari siksa neraka.",
              icon: Icons.bookmark,
            ),
            _DoaCard(
              title: "Doa di Multazam",
              arabic:
                  "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ",
              latin:
                  "Allahumma inni as’aluka al-‘afwa wal-‘aafiyata fid-dunya wal-akhirah.",
              arti:
                  "Ya Allah, aku memohon ampunan dan keselamatan di dunia dan di akhirat.",
              icon: Icons.notifications_active,
            ),
            _DoaCard(
              title: "Doa Sa'i",
              arabic: "إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ",
              latin: "Innas-safa wal-marwata min sha’a’irillah.",
              arti:
                  "Sesungguhnya Shafa dan Marwah adalah sebagian dari syiar Allah.",
              icon: Icons.lock_outline,
            ),
            _DoaCard(
              title: "Doa Tahallul",
              arabic: "اللَّهُمَّ تَقَبَّلْ مِنِّي",
              latin: "Allahumma taqabbal minni.",
              arti: "Ya Allah, terimalah ibadah dariku.",
              icon: Icons.check_circle_outline,
            ),
            _DoaCard(
              title: "Doa Masuk Masjidil Haram",
              arabic: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
              latin: "Allahummaftah li abwaba rahmatik.",
              arti: "Ya Allah, bukakanlah untukku pintu-pintu rahmat-Mu.",
              icon: Icons.door_front_door,
            ),
            _DoaCard(
              title: "Doa Melihat Ka'bah",
              arabic:
                  "اللَّهُمَّ زِدْ هَذَا الْبَيْتَ تَشْرِيفًا وَتَعْظِيمًا وَتَكْرِيمًا وَمَهَابَةً",
              latin:
                  "Allahumma zid hadzal-baita tasyreefan wa ta’zhiman wa takriman wa mahabah.",
              arti:
                  "Ya Allah, tambahkan kemuliaan, kehormatan, kebesaran, dan wibawa pada rumah ini.",
              icon: Icons.visibility,
            ),
            _DoaCard(
              title: "Doa Istilam Hajar Aswad",
              arabic: "بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ",
              latin: "Bismillahi wallahu akbar.",
              arti: "Dengan nama Allah, Allah Maha Besar.",
              icon: Icons.vpn_key,
            ),
            _DoaCard(
              title: "Doa di Padang Arafah",
              arabic: "لَا إِلٰهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ",
              latin: "Lā ilāha illallāhu wahdahū lā sharīka lah, lahul mulku wa lahul hamdu wa huwa ‘alā kulli shay’in qadīr.",
              arti: "Tiada Tuhan selain Allah Yang Maha Esa, milik-Nya segala kerajaan dan pujian, Dia Maha Kuasa atas segala sesuatu.",
              icon: Icons.wb_sunny,
            ),
            _DoaCard(
              title: "Doa Melempar Jumrah",
              arabic: "بِسْمِ اللهِ وَاللهُ أَكْبَرُ، رَغْمًا لِلشَّيْطَانِ وَحِزْبِهِ",
              latin: "Bismillāhi wallāhu akbar, raghman lish-shayṭāni wa ḥizbih.",
              arti: "Dengan nama Allah, Allah Maha Besar, sebagai penghinaan bagi setan dan pengikutnya.",
              icon: Icons.brightness_1,
            ),
          ],
        ),
      ),
    );
  }
}

class _DoaCard extends StatelessWidget {
  final String title;
  final String arabic;
  final String latin;
  final String arti;
  final IconData icon;
  final bool isFavorite;

  const _DoaCard({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.arti,
    required this.icon,
    this.isFavorite = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Icon
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Color(0xFF1B3557),
                  ),
                ),
              ),
              Icon(
                icon,
                color: isFavorite ? Color(0xFFD4AF37) : Color(0xFF1B3557),
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Arabic
          Text(
            arabic,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1B3557),
              fontFamily: 'Amiri', // Ganti dengan font arab jika ada
              height: 1.5,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          // Latin
          Text(
            latin,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1B3557),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 6),
          // Arti
          Text(
            arti,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
