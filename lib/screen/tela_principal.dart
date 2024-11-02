import 'package:flutter/material.dart';
import 'package:my_app/screen/lista_produtos.dart';
import '../widgets/barra_inferior.dart';
import '../widgets/menu_lateral.dart';
import 'minha_conta.dart';
import 'notificacoes.dart';
import 'pedidos.dart';


class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int indiceAtual = 0;

  List<Widget> telas = [const MinhaConta(), TelaListaProdutos(), const Notificacoes()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu App')),
      body: telas[indiceAtual],
      drawer: MenuLateral(),
      bottomNavigationBar: BarraInferior(indiceAtual: indiceAtual, whenClicked: whenClicked,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  void whenClicked(int index) {
    setState(() {
      indiceAtual = index;
     });
  }
}