// Mengimpor pustaka material Flutter
import 'package:flutter/material.dart';

// Mendefinisikan kelas TransitPage yang merupakan StatelessWidget
class TransitPage extends StatelessWidget {
  // Konstruktor TransitPage
  const TransitPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengembalikan widget Scaffold sebagai struktur dasar halaman
    return Scaffold(
      // AppBar dengan judul "Transaksi"
      appBar: AppBar(title: const Text('Transaksi')),

      // Body halaman yang menampilkan teks dan tombol di tengah
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menempatkan elemen ke tengah vertikal
          children: [
            // Teks judul halaman
            const Text(
              "Transaksi Jual Beli Mobil",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Gaya teks
            ),

            // Memberikan jarak antara teks dan tombol
            const SizedBox(height: 20),

            // Tombol untuk memulai transaksi
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman TransactionFormPage ketika tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TransactionFormPage()),
                );
              },
              child: const Text('Mulai Transaksi'), // Teks pada tombol
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionFormPage extends StatefulWidget { // Membuat halaman transaksi sebagai StatefulWidget.
  const TransactionFormPage({super.key});

  @override
  _TransactionFormPageState createState() => _TransactionFormPageState(); // Menghubungkan ke state TransactionFormPage.
}

class _TransactionFormPageState extends State<TransactionFormPage> { 
  final _formKey = GlobalKey<FormState>(); // Global key untuk validasi form.
  final TextEditingController _nameController = TextEditingController(); // Controller untuk input nama.
  final TextEditingController _addressController = TextEditingController(); // Controller untuk input alamat.
  String? _selectedCarModel; // Variabel untuk menyimpan pilihan model mobil.
  String _paymentMethod = 'Cash'; // Default metode pembayaran.

  final List<String> cars = [ // List model mobil yang tersedia.
    "Toyota Camry", "Honda Civic", "Ford Mustang", "Tesla Model S",
    "BMW M3", "Mercedes-Benz C-Class", "Audi A4", "Nissan Skyline",
    "Toyota Alphard", "Maung Pindad", "Mercedes-Benz S-Class",
    "Nissan Serena", "Lamborghini Aventador"
  ];

  void _saveTransaction() { // Fungsi untuk menyimpan transaksi.
    if (_formKey.currentState!.validate()) { // Validasi input form.
      Navigator.push( // Navigasi ke halaman hasil transaksi setelah validasi sukses.
        context,
        MaterialPageRoute(
          builder: (context) => TransactionResultPage(
            name: _nameController.text, // Mengirimkan nama.
            address: _addressController.text, // Mengirimkan alamat.
            carModel: _selectedCarModel!, // Mengirimkan model mobil yang dipilih.
            paymentMethod: _paymentMethod, // Mengirimkan metode pembayaran.
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) { // Membangun tampilan UI halaman form transaksi.
    return Scaffold( // Struktur utama tampilan halaman.
      appBar: AppBar(title: const Text('Form Transaksi')), // AppBar dengan judul "Form Transaksi".
      body: Padding( // Memberikan padding untuk tampilan form.
        padding: const EdgeInsets.all(16.0),
        child: Form( // Widget Form untuk validasi input.
          key: _formKey,
          child: Column( // Mengatur elemen form secara vertikal.
            children: [
              TextFormField( // Input nama pembeli.
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'), // Label input.
                validator: (value) => value!.isEmpty ? 'Harap isi nama' : null, // Validasi input.
              ),
              TextFormField( // Input alamat pembeli.
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Alamat'), // Label input.
                validator: (value) => value!.isEmpty ? 'Harap isi alamat' : null, // Validasi input.
              ),
              const SizedBox(height: 20), // Memberi jarak antara elemen.
              DropdownButtonFormField<String>( // Dropdown untuk memilih model mobil.
                value: _selectedCarModel,
                items: cars.map((car) => DropdownMenuItem( // Mengisi dropdown dengan list mobil.
                  value: car,
                  child: Text(car),
                )).toList(),
                onChanged: (value) => setState(() => _selectedCarModel = value), // Menyimpan pilihan pengguna.
                decoration: const InputDecoration(labelText: 'Jenis Mobil'), // Label dropdown.
                validator: (value) => value == null ? 'Harap pilih jenis mobil' : null, // Validasi input.
              ),
              const SizedBox(height: 20), // Memberi jarak antara elemen.
              DropdownButtonFormField<String>( // Dropdown untuk memilih metode pembayaran.
                value: _paymentMethod,
                items: ['Cash', 'Credit'].map((method) => DropdownMenuItem( // Pilihan metode pembayaran.
                  value: method,
                  child: Text(method),
                )).toList(),
                onChanged: (value) => setState(() => _paymentMethod = value!), // Menyimpan pilihan pengguna.
                decoration: const InputDecoration(labelText: 'Jenis Pembayaran'), // Label dropdown.
              ),
              const SizedBox(height: 20), // Memberi jarak antara elemen.
              ElevatedButton( // Tombol untuk menyimpan transaksi.
                onPressed: _saveTransaction, // Memanggil fungsi _saveTransaction saat tombol ditekan.
                child: const Text('Simpan'), // Teks tombol.
              ),
              const SizedBox(height: 10), // Memberi jarak antara tombol.
              ElevatedButton( // Tombol untuk kembali ke halaman sebelumnya.
                onPressed: () { Navigator.pop(context); }, // Menutup halaman saat tombol ditekan.
                child: const Text('Kembali'), // Teks tombol.
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionResultPage extends StatelessWidget { // Membuat halaman detail transaksi sebagai StatelessWidget.
  final String name; // Variabel untuk menyimpan nama pembeli.
  final String address; // Variabel untuk menyimpan alamat pembeli.
  final String carModel; // Variabel untuk menyimpan jenis mobil yang dipilih.
  final String paymentMethod; // Variabel untuk menyimpan metode pembayaran.

  const TransactionResultPage({ // Konstruktor untuk menerima data dari halaman sebelumnya.
    super.key,
    required this.name,
    required this.address,
    required this.carModel,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) { // Membangun tampilan UI halaman detail transaksi.
    return Scaffold( // Struktur utama tampilan halaman.
      appBar: AppBar(title: const Text('Detail Transaksi')), // AppBar dengan judul "Detail Transaksi".
      body: Padding( // Padding untuk memberi jarak dalam tampilan.
        padding: const EdgeInsets.all(16.0),
        child: Column( // Mengatur elemen secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen di kiri layar.
          children: [
            Text("Nama: $name", style: const TextStyle(fontSize: 18)), // Menampilkan nama pembeli.
            Text("Alamat: $address", style: const TextStyle(fontSize: 18)), // Menampilkan alamat pembeli.
            Text("Jenis Mobil: $carModel", style: const TextStyle(fontSize: 18)), // Menampilkan jenis mobil yang dipilih.
            Text("Jenis Pembayaran: $paymentMethod", style: const TextStyle(fontSize: 18)), // Menampilkan metode pembayaran.
            const SizedBox(height: 20), // Memberi jarak antara elemen dan tombol.
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