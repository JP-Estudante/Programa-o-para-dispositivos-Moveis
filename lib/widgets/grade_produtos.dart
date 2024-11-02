import 'package:flutter/material.dart';
import 'package:my_app/models/produto.dart';

class GradeProdutos extends StatelessWidget {
  final List<Produto> produtos;

  GradeProdutos(this.produtos);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        return GestureDetector(
          //onTap: (){
            //Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) => TelaDetalheProduto(???)) // Continuar daqui como tarefa de casa
            //)
          //},
          child: Card(
            elevation: 15,
            child: Column(
              children: [
                Expanded(child: Image(image: NetworkImage(produto.imagem))),
                Text(produto.titulo),
                Text("R\$" + produto.preco)
              ],
            ),
            ),
        );
      },
    );
  }
}
