import 'package:flutter/material.dart';

// switch-case
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Practicum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutPracticum(),
    );
  }
}

class LayoutPracticum extends StatefulWidget {
  @override
  _LayoutPracticumState createState() => _LayoutPracticumState();
}

class _LayoutPracticumState extends State<LayoutPracticum> {
  int selectedIndex = 1;

  String getMessage(int index){
    switch(index){
      case 1:
      return "ini adalah pesan pertama";
      case 2:
      return "ini adalah pesan kedua";
      case 3:
      return "ini adalah pesan ketiga";
      default: 
      return "pilihan tidak valid";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with swirch-case'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              getMessage(selectedIndex),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<int>(
              value: selectedIndex,
              items: [
                DropdownMenuItem(value: 1, child: Text("Pilihan 1")),
                DropdownMenuItem(value: 2, child: Text("Pilihan 2")),
                DropdownMenuItem(value: 3, child: Text("Pilihan 3")),
              ],
              onChanged: (value){
                setState(() {
                  selectedIndex = value ?? 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
