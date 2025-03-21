import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI.

class ProfilePage extends StatelessWidget { // Membuat halaman profil pengguna sebagai StatelessWidget.
  const ProfilePage({super.key}); // Konstruktor dengan key opsional.

  @override
  Widget build(BuildContext context) { // Membangun tampilan UI halaman profil.
    return Scaffold( // Struktur utama tampilan halaman.
      appBar: AppBar(title: const Text('Profile Pengguna')), // AppBar dengan judul "Profile Pengguna".
      body: Center( // Pusatkan elemen-elemen dalam halaman.
        child: Column( // Menyusun elemen secara vertikal.
          mainAxisAlignment: MainAxisAlignment.center, // Menempatkan elemen di tengah secara vertikal.
          children: [
            const SizedBox(height: 20), // Memberi jarak atas.
            const CircleAvatar( // Menampilkan gambar profil berbentuk lingkaran.
              radius: 50, // Ukuran lingkaran.
              backgroundImage: AssetImage("assets/image.png"), // Menggunakan gambar dari folder assets.
            ),
            const SizedBox(height: 20), // Memberi jarak antara gambar dan teks.
            const Text( // Menampilkan nama pengguna.
              "Hesti Nurhayati",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Mengatur tampilan teks.
            ),
            const Text( // Menampilkan email pengguna.
              "e41232454@student.polije.ac.id",
              style: TextStyle(fontSize: 16, color: Colors.grey), // Mengatur warna dan ukuran teks.
            ),
            const SizedBox(height: 20), // Memberi jarak sebelum tombol.
            ElevatedButton( // Tombol untuk mengedit profil.
              onPressed: () {
                Navigator.push( // Berpindah ke halaman edit profil.
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text('Edit Profil'), // Teks tombol.
            ),
            const SizedBox(height: 10), // Memberi jarak sebelum tombol kembali.
            ElevatedButton( // Tombol untuk kembali ke halaman sebelumnya.
              onPressed: () {
                Navigator.pop(context); // Menutup halaman saat tombol ditekan.
              },
              child: const Text('Kembali'), // Teks tombol.
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget { // Membuat halaman edit profil sebagai StatelessWidget.
  const EditProfilePage({super.key}); // Konstruktor dengan key opsional.

  @override
  Widget build(BuildContext context) { // Membangun tampilan UI halaman edit profil.
    return Scaffold( // Struktur utama tampilan halaman.
      appBar: AppBar(title: const Text('Edit Profil')), // AppBar dengan judul "Edit Profil".
      body: const Center( // Menempatkan elemen di tengah halaman.
        child: Text( // Menampilkan teks informasi.
          "Ini halaman edit profil",
          style: TextStyle(fontSize: 18), // Mengatur ukuran teks.
        ),
      ),
    );
  }
}