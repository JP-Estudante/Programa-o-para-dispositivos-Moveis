import 'package:flutter/material.dart';
import 'package:my_app/repository/repositorio_produto.dart';
import 'package:my_app/widgets/grade_produtos.dart';

import '../models/produto.dart';

class TelaListaProdutos extends StatefulWidget {
  const TelaListaProdutos({super.key});

  @override
  State<TelaListaProdutos> createState() => _TelaListaProdutosState();
}

class _TelaListaProdutosState extends State<TelaListaProdutos> {
  Future<List<Produto>>? futureProdutos;

  @override
  void initState() {
    futureProdutos = getProdutos('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FutureBuilder(
        future: futureProdutos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final produtos = snapshot.data as List<Produto>;
            return GradeProdutos(produtos);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
