import 'package:flutter/material.dart';
import 'package:my_app/models/produto.dart';
import '../screen/produto_detalhes.dart';

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdutoDetalhes(produto: produto),
              ),
            );
          },
          child: Card(
            elevation: 15,
            child: Column(
              children: [
                Expanded(
                  child: produto.imagens.isNotEmpty
                      ? Image.network(produto.imagens[0], fit: BoxFit.cover)
                      : Icon(Icons.broken_image, size: 50),
                ),
                Text(produto.titulo),
                Text("R\$${produto.preco.toStringAsFixed(2)}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
