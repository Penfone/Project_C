import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadUserCt {
  final BuildContext context;
  final TextEditingController nomeController;
  final TextEditingController sobrenomeController;
  final TextEditingController emailController;
  final TextEditingController senhaController;

  CadUserCt({
    required this.context,
    required this.nomeController,
    required this.sobrenomeController,
    required this.emailController,
    required this.senhaController,
  });

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isEmailValido(String email) {
    return email.contains('@') && email.contains('.');
  }

  Future<void> onBotaoPressionado(String rotaDestino) async {
    // final nome = nomeController.text.trim();
    // final sobrenome = sobrenomeController.text.trim();
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();

    if (/*nome.isEmpty || sobrenome.isEmpty ||*/ email.isEmpty ||
        senha.isEmpty) {
      _mostrarMensagem('Por favor, preencha todos os campos');
      return;
    }

    if (!_isEmailValido(email)) {
      _mostrarMensagem('Email inválido. Digite um email correto.');
      return;
    }

    if (senha.length < 6) {
      _mostrarMensagem('A senha deve ter pelo menos 6 caracteres.');
      return;
    }

    try {
      // Criando o usuário no Firebase Auth
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);

      _mostrarMensagem('Cadastro realizado com sucesso!');

      // Navega para a tela de login após o cadastro
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      _mostrarMensagem('Erro ao cadastrar: ${e.toString()}');
    }
  }

  void _mostrarMensagem(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
