import 'package:flutter/material.dart';
import 'package:tridaya_travel/auth/login.dart';
import 'package:tridaya_travel/auth/onboarding.dart';
import 'package:tridaya_travel/views/home.dart';
import 'package:provider/provider.dart';

// Import the BottomNavigationBarProvider you created
import 'package:tridaya_travel/views/home.dart'; // Assuming BottomNavigationBarProvider is in home.dart

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
        '/': (context) => Home(),
        '/login': (context) => const Login(),
        // '/home': (context) => const Home(),
        '/onboarding': (context) => const OnBoarding(),
      },
    );
  }
}
