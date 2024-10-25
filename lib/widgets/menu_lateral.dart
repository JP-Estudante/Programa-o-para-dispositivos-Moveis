import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/screen/tela_config.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('JotaPê'),
            accountEmail: const Text('jotape@gmail.com'),
            currentAccountPicture: ClipOval(
              child: SvgPicture.network(
                'https://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg',
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const CircularProgressIndicator(),
                ),
                fit: BoxFit.cover, // Ajuste como necessário
              ),
            ),
          ),
          ListTile(
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaConfig()));
            },
          ),
          ListTile(
            title: Text('Favoritos'),
            leading: Icon(Icons.favorite),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          const ListTile(
            title: Text('Sair'),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
