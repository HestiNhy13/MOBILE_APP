import 'package:flutter/material.dart';
import 'EditProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  final String name = "Hesti Nurhayati";
  final String email = "e41232454@student.poliije.ac.id";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(email, style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen(name: name, email: email)),
              );
            },
            child: Text('Edit Profil'),
          ),
        ],
      ),
    );
  }
}
