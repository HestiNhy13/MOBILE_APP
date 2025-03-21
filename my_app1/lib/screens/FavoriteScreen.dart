import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteSongs; // Daftar lagu favorit
  final List<Map<String, String>> allSongs;      // Daftar semua lagu
  final Function(Map<String, String>) addToFavorites; // Callback untuk menambahkan lagu ke favorit

  const FavoriteScreen({
    Key? key,
    required this.favoriteSongs,
    required this.allSongs,
    required this.addToFavorites,
  }) : super(key: key);

  // Fungsi untuk menampilkan dialog yang memungkinkan pengguna memilih lagu untuk ditambahkan ke favorit
  void showAddSongDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Lagu Favorit"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true, // Mengurangi ukuran ListView sesuai kontennya
              itemCount: allSongs.length,
              itemBuilder: (context, index) {
                final song = allSongs[index];
                final alreadyFavorite = favoriteSongs.contains(song);

                return ListTile(
                  title: Text(song['title']!),
                  subtitle: Text(song['artist']!),
                  trailing: IconButton(
                    icon: Icon(
                      alreadyFavorite ? Icons.check : Icons.add,
                      color: alreadyFavorite ? Colors.green : null,
                    ),
                    onPressed: () {
                      if (!alreadyFavorite) {
                        addToFavorites(song);
                        Navigator.pop(context); // Tutup dialog setelah menambahkan lagu
                      }
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: favoriteSongs.isEmpty
              ? Center(child: Text("Belum ada lagu favorit"))
              : ListView.builder(
                  itemCount: favoriteSongs.length,
                  itemBuilder: (context, index) {
                    final song = favoriteSongs[index];
                    return ListTile(
                      title: Text(song['title']!),
                      subtitle: Text(song['artist']!),
                      trailing: Icon(Icons.favorite, color: Colors.red),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () => showAddSongDialog(context),
            child: Text("Tambah Lagu Favorit"),
          ),
        ),
      ],
    );
  }
}
