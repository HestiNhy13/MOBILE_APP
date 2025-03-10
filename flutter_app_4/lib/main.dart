import 'package:flutter/material.dart';

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
  int score = 0;

  String getScoreCategory() {
    if (score >= 90) {
      return 'A';
    } else if (score >= 75) {
      return 'B';
    } else if (score >= 60) {
      return 'C';
    } else {
      return 'D';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with if-else Statement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Masukkan Nilai:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Slider(
              value: score.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: score.toString(),
              onChanged: (double value) {
                setState(() {
                  score = value.toInt();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Kategori Nilai: ${getScoreCategory()}',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
