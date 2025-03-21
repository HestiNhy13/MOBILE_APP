import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:my_app1/screens/SongList.dart';
import 'package:my_app1/screens/FavoriteScreen.dart';
import 'package:my_app1/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> songs = [
    {'title': 'Bohemian Rhapsody', 'artist': 'Queen'},
    {'title': 'Imagine', 'artist': 'John Lennon'},
    {'title': 'Hotel California', 'artist': 'Eagles'},
    {'title': 'Hey Jude', 'artist': 'The Beatles'},
    {'title': 'Stairway to Heaven', 'artist': 'Led Zeppelin'},
    {'title': 'Smells Like Teen Spirit', 'artist': 'Nirvana'},
    {'title': 'Sweet Child O’ Mine', 'artist': 'Guns N’ Roses'},
    {'title': 'Billie Jean', 'artist': 'Michael Jackson'},
    {'title': 'Like a Rolling Stone', 'artist': 'Bob Dylan'},
    {'title': 'Wonderwall', 'artist': 'Oasis'},
  ];

  final List<Map<String, String>> favoriteSongs = [];

  void addToFavorites(Map<String, String> song) {
    setState(() {
      if (!favoriteSongs.contains(song)) {
        favoriteSongs.add(song);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Music App'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.music_note), text: 'Songs'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.music_note, size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    const Text('Music App', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Songs'),
                onTap: () {
                  Navigator.pop(context);
                  DefaultTabController.of(context)?.animateTo(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorites'),
                onTap: () {
                  Navigator.pop(context);
                  DefaultTabController.of(context)?.animateTo(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  DefaultTabController.of(context)?.animateTo(2);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SongList(songs: songs, addToFavorites: addToFavorites),
            FavoriteScreen(favoriteSongs: favoriteSongs, allSongs: songs, addToFavorites: addToFavorites),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
