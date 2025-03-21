// Mengimpor pustaka material Flutter
import 'package:flutter/material.dart';

// Mendeklarasikan kelas CarPage yang merupakan StatelessWidget
class CarPage extends StatelessWidget {
  // Konstruktor CarPage
  const CarPage({super.key});

  // Override metode build untuk membangun tampilan UI
  @override
  Widget build(BuildContext context) {
    // Daftar mobil dalam bentuk list string
    final List<String> cars = [
      "Toyota Camry",
      "Honda Civic",
      "Ford Mustang",
      "Tesla Model S",
      "BMW M3",
      "Mercedes-Benz C-Class",
      "Audi A4",
      "Nissan Skyline",
      "Toyota Alphard",
      "Maung Pindad",
      "Mercedes-Benz S-Class",
      "Nissan Serena",
      "Lamborghini Aventador"
    ];

    // Mengembalikan widget Scaffold sebagai struktur dasar halaman
    return Scaffold(
      body: Column( // Menggunakan Column untuk menyusun widget secara vertikal
        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun widget dari kiri
        children: [
          // Widget Padding untuk memberi jarak
          const Padding(
            padding: EdgeInsets.all(16.0), // Padding di semua sisi sebesar 16
            child: Text(
              "Jenis Mobil di Garasi:", // Judul daftar mobil
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Gaya teks
            ),
          ),
          // Widget Expanded agar ListView memenuhi sisa ruang layar
          Expanded(
            child: ListView.builder( // Menggunakan ListView.builder untuk daftar yang dinamis
              itemCount: cars.length, // Jumlah item sesuai panjang list cars
              itemBuilder: (context, index) {
                return ListTile( // Widget untuk setiap item daftar
                  leading: const Icon(Icons.directions_car), // Ikon mobil di sebelah kiri
                  title: Text(cars[index]), // Nama mobil
                  subtitle: Text("Model tahun ${(2000 + index).toString()}"), // Tahun model mobil
                  onTap: () { // Event ketika item ditekan
                    Navigator.push( // Navigasi ke halaman detail mobil
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailPage(carName: cars[index]), // Mengirim nama mobil ke halaman berikutnya
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// Mendefinisikan kelas CarDetailPage yang merupakan StatelessWidget
class CarDetailPage extends StatelessWidget {
  // Variabel final untuk menyimpan nama mobil yang akan ditampilkan
  final String carName;

  // Konstruktor untuk menerima parameter carName sebagai input wajib (required)
  const CarDetailPage({super.key, required this.carName});

  @override
  Widget build(BuildContext context) {
    // Mengembalikan widget Scaffold sebagai struktur dasar halaman
    return Scaffold(
      // AppBar dengan judul sesuai nama mobil yang diterima
      appBar: AppBar(title: Text(carName)),

      // Body halaman yang berisi teks ditampilkan di tengah
      body: Center(
        child: Text(
          "Ini adalah jenis mobil: $carName", // Menampilkan nama mobil dalam teks
          style: const TextStyle(fontSize: 20), // Mengatur ukuran teks menjadi 20
        ),
      ),
    );
  }
}