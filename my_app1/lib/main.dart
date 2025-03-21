import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart'; // Impor HomeScreen dari folder screens

// Fungsi utama sebagai entry point aplikasi
void main() {
  runApp(const MyApp()); // Menjalankan aplikasi dengan widget MyApp sebagai root
}

// Widget utama aplikasi yang bersifat stateless
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: HomeScreen(), // Menetapkan HomeScreen sebagai halaman awal
    );
  }
}
