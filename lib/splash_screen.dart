import 'package:flutter/material.dart';
import 'main.dart'; // Import file utama aplikasi

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah 3 detik, pindah ke halaman utama (Quizzler)
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Quizzler()), // Pindah ke halaman utama
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background hitam
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi
            Image.asset(
              'images/logo.png', // Pastikan file logo ada di folder assets
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20),
            // Animasi loading
            CircularProgressIndicator(
              color: Colors.blue, // Warna loading biru
            ),
          ],
        ),
      ),
    );
  }
}
