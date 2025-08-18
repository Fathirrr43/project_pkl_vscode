import 'package:flutter/material.dart';
import 'package:tridaya_travel/auth/login.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text('Konfirmasi Logout', textAlign: TextAlign.center),
          content: const Text(
            'Apakah Anda yakin ingin logout?',
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false, // Remove all previous routes
                );
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profil Saya', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
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
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/pp.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xff27b3b3),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Muhammad Fathir Alfarizi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'Jamaah',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  // Tanggal Keberangkatan
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 12), // jarak antar box
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF), // biru muda
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6), // biru icon bg
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const ImageIcon(
                            AssetImage('assets/icons/jadwal.png'),
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Tanggal Keberangkatan",
                                style: TextStyle(color: Colors.black54)),
                            SizedBox(height: 4),
                            Text("09 Desember 2025",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        )
                      ],
                    ),
                  ),

                  // Status
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4), // hijau muda
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E), // hijau icon bg
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const ImageIcon(
                            AssetImage('assets/icons/status.png'),
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Status", style: TextStyle(color: Colors.black54)),
                            SizedBox(height: 4),
                            Text("Terdaftar",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3B82F6),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/editprofile.png'),
                      size: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text('Edit Profil'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Logout Button
              ElevatedButton(
                onPressed:
                    _showLogoutConfirmationDialog, // Call the confirmation dialog function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  // Removed the black border side
                  // side: BorderSide(color: Colors.black),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ), // Changed text color to white for better contrast
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
