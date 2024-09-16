import 'package:flutter/material.dart';
import 'loginscreen.dart'; // Mengimpor halaman login
import 'beranda.dart'; // Mengimpor halaman beranda

void main() {
  runApp(LetsDoApp());
}

class LetsDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Halaman pertama yang tampil (Splash Screen)
      routes: {
        '/login': (context) => LoginScreen(), // Route untuk halaman login
        '/beranda': (context) => BerandaScreen(), // Route untuk halaman beranda
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Menunda selama 5 detik, kemudian navigasi ke halaman login
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_box_rounded,
              color: Colors.purple,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              "Let's Do",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
