// lib/controllers/login_ct.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCt {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController senhaController;

  LoginCt({
    required this.context,
    required this.emailController,
    required this.senhaController,
  });

  bool _isEmailValido(String email) {
    return email.contains('@') && email.contains('.');
  }

  void onBotaoPressionado(String rotaDestino) async {
    // Se for para a tela de cadastro, pula a validação e navega direto
    if (rotaDestino == '/cadUser') {
      Navigator.pushNamed(context, rotaDestino);
      return;
    }

    final email = emailController.text.trim();
    final senha = senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      _mostrarMensagem('Por favor, preencha todos os campos');
      return;
    }

    if (!_isEmailValido(email)) {
      _mostrarMensagem('Email inválido. Digite um email correto.');
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      _mostrarMensagem('Usuário logado com sucesso!');
      Navigator.pushNamed(context, rotaDestino);
    } catch (e) {
      // Aqui você pode tratar o erro de forma mais detalhada, se desejar.
      _mostrarMensagem('Erro ao efetuar login: ${e.toString()}');
      print(e);
    }
  }

  void _mostrarMensagem(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
