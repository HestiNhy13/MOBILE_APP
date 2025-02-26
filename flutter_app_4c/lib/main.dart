import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ItemModel {
  final int id;
  final String name;
  final String description;

  ItemModel({required this.id, required this.name, required this.description});
}

class ItemCard extends StatelessWidget {
  final ItemModel item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = item.id % 2 == 0 ? Colors.green[100]! : Colors.blue[100]!;

    return Card(
      color: cardColor,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${item.id}'),
        ),
        title: Text(item.name),
        subtitle: Text(item.description),
      ),
    );
  }
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
  @override
  Widget build(BuildContext context) {
    List<ItemModel> items = [];

    for (int i = 1; i <= 10; i++) {
      String name = i % 2 == 0 ? 'Bilangan Genap $i' : 'Bilangan Ganjil $i';
      String description =
          i % 2 == 0 ? 'Ini adalah bilangan genap.' : 'Ini adalah bilangan ganjil.';

      items.add(ItemModel(id: i, name: name, description: description));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout with OOP and Loop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(item: items[index]);
          },
        ),
      ),
    );
  }
}
