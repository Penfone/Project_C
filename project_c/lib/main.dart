import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home_sc.dart'; // Importando a tela criada
import 'screens/login_sc.dart'; // Importando a tela criada
import 'screens/cadUser_sc.dart'; // Importando a tela criada

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Rota inicial
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const HomeScreen(),
        '/cadUser': (context) => const CadUser()
      },
    );
  }
}
