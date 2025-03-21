import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/routes/app_routes.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();

  try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "email@example.com",
    password: "password123",
  );
} on FirebaseAuthException catch (e) {
  print("Firebase Auth Error: ${e.message}");
} catch (e) {
  print("General Error: $e");
}

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.login, // Mulai dari halaman login
      routes: AppRoutes.routes, // Menggunakan generateRoute
    );
  }
}
