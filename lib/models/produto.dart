class Produto{
  String titulo;
  String preco;
  String descricao;
  String imagem;

  Produto({
    required this.titulo,
    required this.preco,
    required this.descricao,
    required this.imagem
  });

  Produto.fromJson(Map<String, dynamic> json)
      : titulo = json['title'].toString(),
        preco = json['price'].toString(),
        descricao = json['description'].toString(),
        imagem = json['thumbnail'].toString();
}