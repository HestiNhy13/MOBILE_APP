import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  // Properti yang menyimpan daftar lagu
  final List<Map<String, String>> songs;
  // Fungsi callback untuk menambahkan lagu ke favorit
  final Function(Map<String, String>) addToFavorites;

  // Konstruktor dengan `super.key`
  const SongList({
    Key? key,
    required this.songs,
    required this.addToFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
          title: Text(song['title']!), // Menampilkan judul lagu
          subtitle: Text(song['artist']!), // Menampilkan nama artis
          trailing: IconButton(
            icon: const Icon(Icons.favorite_border), // Ikon tambah ke favorit
            onPressed: () => addToFavorites(song), // Memanggil fungsi callback
          ),
        );
      },
    );
  }
}
