import 'package:flutter/material.dart';
import 'package:project_c/controllers/cadUser_ct.dart';

class CadUser extends StatefulWidget {
  const CadUser({super.key});

  @override
  State<CadUser> createState() => _CadUserState();
}

class _CadUserState extends State<CadUser> {
  // Controladores de texto
  final _nomeController = TextEditingController();
  final _sobrenomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  late CadUserCt _cadUserCt;

  @override
  void initState() {
    super.initState();
    // Instanciamos a controller passando o context e os controllers
    _cadUserCt = CadUserCt(
      context: context,
      nomeController: _nomeController,
      sobrenomeController: _sobrenomeController,
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
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              // const Align(
              //   alignment: Alignment.topLeft,
              //   child: Text('Você será cadastrado aqui!'),
              // ),
              const SizedBox(height: 20),
              // //Nome
              // const Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     'Nome:',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: Color.fromARGB(255, 0, 0, 0),
              //     ),
              //   ),
              // ),
              // TextField(
              //   controller: _nomeController,
              //   style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              //   cursorColor: const Color.fromARGB(255, 0, 0, 0),
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.blue, width: 2.0),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // //Sobrenome
              // const Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     'Sobrenome:',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: Color.fromARGB(255, 0, 0, 0),
              //     ),
              //   ),
              // ),
              // TextField(
              //   controller: _sobrenomeController,
              //   style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              //   cursorColor: const Color.fromARGB(255, 0, 0, 0),
              //   decoration: const InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.blue, width: 2.0),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // Email
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: const Color.fromARGB(255, 0, 0, 0),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Senha
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Senha:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              TextField(
                controller: _senhaController,
                obscureText: true,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: const Color.fromARGB(255, 0, 0, 0),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              //Botão de cadastro
              ElevatedButton(
                onPressed: () => _cadUserCt.onBotaoPressionado('/login'),
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 21, 100, 133),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
