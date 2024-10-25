import 'package:flutter/material.dart';

class TelaConfig extends StatelessWidget {
  const TelaConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações')),
        body: Center(child: Text('Tela de configurações')),
    );
  }
}
