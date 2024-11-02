import 'dart:convert';
import '../models/produto.dart';
import 'package:http/http.dart' as http;

Future<List<Produto>> getProdutos(busca) async{
 // A URL da API
 const baseUrl = "https://dummyjson.com/products/search?q=";
 var url = baseUrl + busca;
 final resposta = await http.get(
  Uri.parse(url),
  //headers: {
  // HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
  //}
 );

 final json = jsonDecode(resposta.body)['products'];

 return List<Produto>.from(json.map((elemento){
  return Produto.fromJson(elemento);
 }));
}



