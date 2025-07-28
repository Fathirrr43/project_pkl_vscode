import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textView(margin, text, posisi, warna, tebal, ukuran) {
  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: posisi,
      style: GoogleFonts.poppins(
        color: warna,
        fontWeight: tebal,
        fontSize: ukuran,
      ),
    ),
  );
}

// Widget untuk ikon pelayanan
class ServiceIcon extends StatelessWidget {
  final String assetIcon;
  final String label;
  final Color color;
  final VoidCallback? onTap; // Tambahkan parameter onTap

  const ServiceIcon({
    required this.assetIcon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            assetIcon,
            width: 36,
            height: 36,
            // color: color, // Hapus jika icon PNG sudah berwarna
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// Widget untuk card berita
class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const NewsCard({
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF1E4584),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(fontSize: 11, color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
