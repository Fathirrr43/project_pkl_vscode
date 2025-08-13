import 'package:flutter/material.dart';
import 'package:tridaya_travel/views/home.dart';
import 'package:tridaya_travel/views/keberangkatan.dart';
import 'package:tridaya_travel/views/panduan.dart';
import 'package:tridaya_travel/views/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // Definisi halaman
  final List<Widget> page = [
    const Home(),
    const Keberangkatan(),
    const Panduan(),
    const Profile(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF315A8A),
        unselectedItemColor: const Color(0xFFB1B1B1),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 0
                  ? 'assets/icons/beranda2.png'
                  : 'assets/icons/beranda.png',
              width: 24,
              height: 24,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 1
                  ? 'assets/icons/keberangkatan2.png'
                  : 'assets/icons/keberangkatan.png',
              width: 24,
              height: 24,
            ),
            label: 'Keberangkatan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 2
                  ? 'assets/icons/panduan2.png'
                  : 'assets/icons/panduan.png',
              width: 24,
              height: 24,
            ),
            label: 'Panduan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 3
                  ? 'assets/icons/profile2.png'
                  : 'assets/icons/profile.png',
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
