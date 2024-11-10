class Produto {
  final int id;
  final String titulo;
  final String descricao;
  final String categoria;
  final double preco;
  final double desconto;
  final double classificacao;
  final int estoque;
  final String marca;
  final String sku;
  final double peso;
  final Dimensions dimensoes;
  final String garantia;
  final String informacaoEnvio;
  final String statusDisponibilidade;
  final String politicaDeRetorno;
  final int quantidadeMinima;
  final List<String> imagens;
  final String thumbnail;
  final List<Review> reviews;

  Produto({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.preco,
    required this.desconto,
    required this.classificacao,
    required this.estoque,
    required this.marca,
    required this.sku,
    required this.peso,
    required this.dimensoes,
    required this.garantia,
    required this.informacaoEnvio,
    required this.statusDisponibilidade,
    required this.politicaDeRetorno,
    required this.quantidadeMinima,
    required this.imagens,
    required this.thumbnail,
    required this.reviews,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] ?? 0,
      titulo: json['title'] ?? '', // Valor padrão vazio
      descricao: json['description'] ?? '', // Valor padrão vazio
      categoria: json['category'] ?? '', // Valor padrão vazio
      preco: json['price']?.toDouble() ?? 0.0, // Se for nulo, usa 0
      desconto: json['discountPercentage']?.toDouble() ?? 0.0, // Se for nulo, usa 0
      classificacao: json['rating']?.toDouble() ?? 0.0, // Se for nulo, usa 0
      estoque: json['stock'] ?? 0, // Se for nulo, usa 0
      marca: json['brand'] ?? '', // Valor padrão vazio
      sku: json['sku'] ?? '', // Valor padrão vazio
      peso: json['weight']?.toDouble() ?? 0.0, // Se for nulo, usa 0
      dimensoes: Dimensions.fromJson(json['dimensions'] ?? {}),
      garantia: json['warrantyInformation'] ?? '', // Valor padrão vazio
      informacaoEnvio: json['shippingInformation'] ?? '', // Valor padrão vazio
      statusDisponibilidade: json['availabilityStatus'] ?? '', // Valor padrão vazio
      politicaDeRetorno: json['returnPolicy'] ?? '', // Valor padrão vazio
      quantidadeMinima: json['minimumOrderQuantity'] ?? 0, // Se for nulo, usa 0
      imagens: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '', // Valor padrão vazio
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((reviewJson) => Review.fromJson(reviewJson))
          .toList() ?? [],
    );
  }
}

class Dimensions {
  final double largura;
  final double altura;
  final double profundidade;

  Dimensions({
    required this.largura,
    required this.altura,
    required this.profundidade,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      largura: json['width']?.toDouble() ?? 0.0,
      altura: json['height']?.toDouble() ?? 0.0,
      profundidade: json['depth']?.toDouble() ?? 0.0,
    );
  }
}

class Review {
  final double rating;
  final String comentario;
  final String data;
  final String nomeRevisor;
  final String emailRevisor;

  Review({
    required this.rating,
    required this.comentario,
    required this.data,
    required this.nomeRevisor,
    required this.emailRevisor,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating']?.toDouble() ?? 0.0,
      comentario: json['comment'] ?? '', // Valor padrão vazio
      data: json['date'] ?? '', // Valor padrão vazio
      nomeRevisor: json['reviewerName'] ?? '', // Valor padrão vazio
      emailRevisor: json['reviewerEmail'] ?? '', // Valor padrão vazio
    );
  }
}