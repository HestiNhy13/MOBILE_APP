// Mengimpor pustaka utama Flutter untuk membangun UI
import 'package:flutter/material.dart';

// Membuat class CounterProvider yang mengelola state counter
// Menggunakan ChangeNotifier agar bisa memberi tahu listener ketika ada perubahan state
class CounterProvider with ChangeNotifier {
  // Private variable untuk menyimpan nilai counter
  int _count = 0;

  // Getter untuk mendapatkan nilai counter dari luar class
  int get count => _count;

  // Method untuk menambah nilai counter
  void increment() {
    _count++; // Menambah nilai _count
    notifyListeners(); // Memberi tahu listener bahwa ada perubahan data
  }

  // Method untuk mengurangi nilai counter
  void decrement() {
    if (_count > 0) { // Memastikan nilai counter tidak kurang dari 0
      _count--; // Mengurangi nilai _count
      notifyListeners(); // Memberi tahu listener bahwa ada perubahan data
    }
  }
}
