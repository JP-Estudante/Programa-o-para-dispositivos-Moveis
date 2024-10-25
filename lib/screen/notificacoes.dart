import 'package:flutter/material.dart';

class Notificacoes extends StatelessWidget {
  const Notificacoes({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.lightGreenAccent, 
          child: Center(
            child: Text('Container fixo',
                style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ),
        Flexible(
          flex: 2,
          // ignore: prefer_const_constructors
          child: Container(
            color: Colors.teal, 
            child: Center(
              child: Text('Flexible - 2',
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.deepOrangeAccent, 
            child: Center(
              child: Text('Flexible - 2',
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ),
        ),
      ],
    );
  }
}
