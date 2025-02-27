import 'package:flutter/material.dart';

// do-while loop
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Percabangan & Loop',
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
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> numbers = [];
    int i = 1;

    do{
      numbers.add({
        'number' : i,
        'type' : (i % 2 == 0) ? 'Genap' : 'Ganjil'
      }); i++;
    }while(i <= 10);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Percabangan & Loop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${numbers[index]['number']}'),
                ),
                title: Text('Angka ${numbers[index]['type']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
