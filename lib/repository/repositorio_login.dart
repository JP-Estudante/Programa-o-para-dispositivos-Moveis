import 'package:http/http.dart' as http;

Future<http.Response> loginApi(usuario, senha) async{

  const url = 'https://dummyjson.com/auth/login';
  final usuarioData = {
    'username' : usuario,
    'password' : senha
  };

  try {
    final resposta = await http.post(
        Uri.parse(url),
        body: usuarioData
    );
    return resposta;
  } catch (e) {
    throw Exception('Erro na requisição: $e');
  }
}
