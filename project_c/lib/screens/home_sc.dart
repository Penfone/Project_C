import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/menu_wid.dart'; // Importe seu menu lateral

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser; // Obtém o usuário logado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const Menu(), // Mantendo o menu lateral
      body: Center(
        child: Text(
          _user != null
              ? 'Bem-vindo, ${_user!.email}'
              : 'Nenhum usuário logado',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
