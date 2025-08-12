import 'package:flutter/material.dart';
import 'package:tridaya_travel/auth/login.dart';
import 'package:tridaya_travel/auth/onboarding.dart';
import 'package:tridaya_travel/auth/splashscreen.dart';
import 'package:tridaya_travel/views/doa.dart';
import 'package:tridaya_travel/views/faq.dart';
import 'package:tridaya_travel/views/home.dart';
import 'package:provider/provider.dart';
import 'package:tridaya_travel/views/panduan.dart';
import 'package:tridaya_travel/views/keberangkatan.dart';
import 'package:tridaya_travel/views/lokasi.dart';
import 'package:tridaya_travel/views/profile.dart';
import 'package:tridaya_travel/views/shalat.dart';
import 'package:tridaya_travel/views/umrah.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavigationBarProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tridaya Travel',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => const OnBoarding(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/umrah': (context) => const PaketUmrah(),
        '/lokasi': (context) => const LokasiCabang(),
        '/sholat': (context) => const WaktuShalat(),
        '/faq': (context) => const Faq(),
        '/jadwal': (context) => const Panduan(),
        '/keberangkatan': (context) => const Keberangkatan(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
