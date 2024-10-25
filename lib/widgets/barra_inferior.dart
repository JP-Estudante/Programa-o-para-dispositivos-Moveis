import 'package:flutter/material.dart';

class BarraInferior extends StatelessWidget {
  int indiceAtual;
  Function(int) whenClicked;

  BarraInferior({
    required this.indiceAtual, 
    required this.whenClicked
    });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indiceAtual,
      onTap: whenClicked,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded), label: 'Conta'),
        BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded),
            label: 'Pedidos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notification_important), label: 'Notificações'),
      ],
    );
  }
}
