// Mengimpor pustaka utama Flutter untuk membangun UI
import 'package:flutter/material.dart';

// Mengimpor provider yang mengelola state counter
import 'package:flutter_praktikum/providers/counter_provider.dart';

// Mengimpor package provider untuk state management
import 'package:provider/provider.dart';

// Mengimpor file CounterScreen yang akan digunakan sebagai halaman utama
import 'providers/counter_screen.dart';

void main() {
  // Menjalankan aplikasi dengan MultiProvider
  runApp(
    MultiProvider(
      providers: [
        // Menyediakan instance dari CounterProvider agar dapat digunakan dalam aplikasi
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      // Memulai aplikasi dengan widget MyApp sebagai root
      child: const MyApp(),
    ),
  );
}

// Widget utama aplikasi yang bersifat Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management', // Judul aplikasi
      home: const CounterScreen(), // Menampilkan CounterScreen sebagai halaman utama
    );
  }
}
