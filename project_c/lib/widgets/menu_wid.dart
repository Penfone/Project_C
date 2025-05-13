import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Cabeçalho do menu
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Text(
              'Meu Menu Lateral',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Itens do menu
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              // Fechar o Drawer
              Navigator.pop(context);
              // Navegar para outra tela, se quiser
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para outra tela, se quiser
            },
          ),
          // Adicione mais opções conforme sua necessidade
        ],
      ),
    );
  }
}
