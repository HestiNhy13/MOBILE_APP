import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI.
import 'car_page.dart'; // Mengimpor halaman car_page.dart.
import 'transit_page.dart'; // Mengimpor halaman transit_page.dart.
import 'profile_page.dart'; // Mengimpor halaman profile_page.dart.

void main() => runApp(const MyApp()); // Fungsi utama untuk menjalankan aplikasi.

class MyApp extends StatelessWidget { // Kelas utama aplikasi menggunakan StatelessWidget.
  const MyApp({super.key}); // Konstruktor dengan key opsional.

  static const appTitle = 'Drawer & Tabs Demo'; // Judul aplikasi.

  @override
  Widget build(BuildContext context) { // Membangun UI aplikasi.
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan label "debug" di pojok kanan atas.
      title: appTitle, // Mengatur judul aplikasi.
      home: MyHomePage(title: appTitle), // Menetapkan halaman utama.
    );
  }
}

class MyHomePage extends StatefulWidget { // Kelas halaman utama sebagai StatefulWidget.
  const MyHomePage({super.key, required this.title}); // Konstruktor dengan key dan title.

  final String title; // Variabel untuk menyimpan judul halaman.

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Membuat state untuk halaman utama.
}

// Kelas _MyHomePageState yang merupakan state dari MyHomePage
// Menerapkan SingleTickerProviderStateMixin untuk animasi TabController
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Controller untuk TabBar

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Inisialisasi TabController dengan 3 tab
  }

  @override
  void dispose() {
    _tabController.dispose(); // Membersihkan TabController saat widget dihapus untuk mencegah kebocoran memori
    super.dispose();
  }

  // Fungsi untuk menangani perpindahan tab dari Drawer
  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index; // Mengubah tab yang aktif berdasarkan indeks yang dipilih
    });
    Navigator.pop(context); // Menutup drawer setelah navigasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Menampilkan judul halaman di AppBar
        leading: Builder( // Tombol menu untuk membuka drawer
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Ikon menu
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Membuka drawer saat tombol ditekan
              },
            );
          },
        ),
        bottom: TabBar( // Menambahkan TabBar di bawah AppBar
          controller: _tabController, // Menghubungkan TabBar dengan TabController
          tabs: const [
            Tab(icon: Icon(Icons.directions_car), text: "Mobil"), // Tab pertama (Mobil)
            Tab(icon: Icon(Icons.attach_money), text: "Transaksi"), // Tab kedua (Transaksi)
            Tab(icon: Icon(Icons.person), text: "Profile"), // Tab ketiga (Profile)
          ],
        ),
      ),
      body: TabBarView( // Menampilkan konten yang sesuai dengan tab yang dipilih
        controller: _tabController, // Menghubungkan dengan TabController
        children: const [
          CarPage(), // Halaman untuk tab "Mobil"
          TransitPage(), // Halaman untuk tab "Transaksi"
          ProfilePage(), // Halaman untuk tab "Profile"
        ],
      ),
      drawer: Drawer( // Drawer navigasi di sisi kiri layar
        child: ListView( // Menggunakan ListView untuk daftar menu dalam drawer
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader( // Bagian header dalam drawer
              decoration: BoxDecoration(color: Colors.blue), // Warna latar belakang header
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)), // Judul dalam header
            ),
            ListTile( // Opsi menu untuk tab "Mobil"
              title: const Text('Mobil'), // Label menu
              onTap: () => _onItemTapped(0), // Navigasi ke tab "Mobil" saat diklik
            ),
            ListTile( // Opsi menu untuk tab "Transaksi"
              title: const Text('Transaksi'), // Label menu
              onTap: () => _onItemTapped(1), // Navigasi ke tab "Transaksi" saat diklik
            ),
            ListTile( // Opsi menu untuk tab "Profile"
              title: const Text('Profile'), // Label menu
              onTap: () => _onItemTapped(2), // Navigasi ke tab "Profile" saat diklik
            ),
          ],
        ),
      ),
    );
  }
}