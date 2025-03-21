import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'Navigation Basics', home: RoutePertama()));
}

class RoutePertama extends StatelessWidget {
  const RoutePertama({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Pertama')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Buka Route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RouteKedua()),
            );
          },
        ),
      ),
    );
  }
}

class RouteKedua extends StatelessWidget {
  const RouteKedua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Kedua')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Kembali Lagi'),
        ),
      ),
    );
  }
}
