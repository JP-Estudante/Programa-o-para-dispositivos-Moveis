import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoDetalhes extends StatefulWidget {
  final Produto produto;

  const ProdutoDetalhes({Key? key, required this.produto}) : super(key: key);

  @override
  _ProdutoDetalhesState createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.titulo),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagens do Produto
            if (widget.produto.imagens.isNotEmpty)
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: widget.produto.imagens.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.produto.imagens[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                            child: Icon(Icons.broken_image, size: 50));
                      },
                    );
                  },
                ),
              ),
            SizedBox(height: 16.0),

            // Título
            Text(widget.produto.titulo,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),

            // Classificação
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text('${widget.produto.classificacao}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8.0),

            // Categoria e Marca
            Text('Categoria: ${widget.produto.categoria}'),
            Text('Marca: ${widget.produto.marca}'),
            SizedBox(height: 8.0),

            // Preço e Desconto
            Text('Preço: R\$${widget.produto.preco.toStringAsFixed(2)}'),
            Text('Desconto: ${widget.produto.desconto}%'),
            SizedBox(height: 8.0),

            // Estoque e SKU
            Text('Em Estoque: ${widget.produto.estoque} unidades'),
            Text('SKU: ${widget.produto.sku}'),
            SizedBox(height: 8.0),

            // Dimensões e Peso
            Text(
                'Dimensões: ${widget.produto.dimensoes.largura} x ${widget.produto.dimensoes.altura} x ${widget.produto.dimensoes.profundidade} cm'),
            Text('Peso: ${widget.produto.peso} kg'),
            SizedBox(height: 8.0),

            // Garantia e Informação de Envio
            Text('Garantia: ${widget.produto.garantia}'),
            Text('Informação de Envio: ${widget.produto.informacaoEnvio}'),
            Text('Status: ${widget.produto.statusDisponibilidade}'),
            SizedBox(height: 8.0),

            // Política de Retorno e Quantidade Mínima
            Text('Política de Retorno: ${widget.produto.politicaDeRetorno}'),
            Text(
                'Quantidade Mínima de Pedido: ${widget.produto.quantidadeMinima}'),

            // Reviews
            SizedBox(height: 16.0),
            Text('Avaliações:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.produto.reviews.map((review) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text('${review.rating}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Text('"${review.comentario}" - ${review.nomeRevisor}'),
                  Text('Data: ${review.data}'),
                  SizedBox(height: 8.0),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
