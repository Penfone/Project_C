import 'package:flutter/material.dart';
import 'package:project_c/controllers/login_ct.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controladores de texto
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  late LoginCt _loginCt;

  @override
  void initState() {
    super.initState();
    // Instanciamos a controller passando o context e os controllers
    _loginCt = LoginCt(
      context: context,
      emailController: _emailController,
      senhaController: _senhaController,
    );
  }

  @override
  void dispose() {
    // Importante liberar recursos
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 100, 133),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Login'),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 21, 100, 133),
          fontSize: 24.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Logo
                const Image(
                  image: AssetImage('Lib/Images/logo_test01.png'),
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 16),

                // Label Email
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Label Senha
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Senha:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextField(
                  controller: _senhaController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Botões
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Ao clicar em "Logar", chamamos a controller para validar e navegar
                        _loginCt.onBotaoPressionado('/home');
                      },
                      child: const Text(
                        'Logar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 100, 133),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Ao clicar em "Cadastrar-se", chamamos a controller
                        _loginCt.onBotaoPressionado('/cadUser');
                      },
                      child: const Text(
                        'Cadastrar-se',
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 100, 133),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
