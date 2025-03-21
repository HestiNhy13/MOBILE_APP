// Mengimpor pustaka utama Flutter untuk membangun UI
import 'package:flutter/material.dart';

// Mengimpor pustaka Provider untuk state management
import 'package:provider/provider.dart';

// Mengimpor file provider yang berisi CounterProvider untuk mengelola state counter
import 'package:flutter_praktikum/providers/counter_provider.dart';

// Mendefinisikan class CounterScreen sebagai StatefulWidget 
// karena UI akan berubah berdasarkan perubahan state counter
class CounterScreen extends StatefulWidget {
  // Konstruktor const untuk widget agar lebih efisien dalam penggunaan memori
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// State dari CounterScreen yang mengelola UI berdasarkan perubahan state counter
class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // Mengakses CounterProvider menggunakan Provider.of()
    // untuk mendapatkan nilai count dan fungsi increment/decrement
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      // Membuat AppBar dengan judul aplikasi
      appBar: AppBar(title: const Text('State Management - Provider')),
      
      // Membuat body utama yang berisi teks counter dan tombol aksi
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan teks statis "Counter Value:"
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            
            // Menampilkan nilai counter yang diperoleh dari provider
            Text(
              '${counterProvider.count}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 20), // Memberikan jarak vertikal
            
            // Membuat row untuk tombol increment dan decrement
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol untuk menambah nilai counter
                ElevatedButton(
                  onPressed: counterProvider.increment,
                  child: const Text('Increment'),
                ),
                
                const SizedBox(width: 10), // Memberikan jarak horizontal
                
                // Tombol untuk mengurangi nilai counter
                ElevatedButton(
                  onPressed: counterProvider.decrement,
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
