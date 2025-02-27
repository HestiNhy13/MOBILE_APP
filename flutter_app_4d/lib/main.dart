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
      home: LoopConditionalPracticum(),
    );
  }
}

class LoopConditionalPracticum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    int i = 1;

    while (i <= 10){
      numbers.add(i);
      i++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('While Loop & Conditional in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            int number = numbers[index];
            Color bgColor = number % 2 == 0 ? Colors.blue[200]! : Colors.green[200]!;

            return Card(
              color: bgColor,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(child: Text('$number'),),
                title: Text('Angka $number'),
                subtitle: Text(number % 2 == 0 ? 'Bilangan Genap' : 'Bilangan Ganjil'),
              ),
            );
          },
        ),
      ),
    );
  }
}
