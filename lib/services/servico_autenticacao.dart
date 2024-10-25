import 'package:http/http.dart' as http;
import 'package:my_app/repository/repositorio_login.dart';
import 'dart:convert';
import '../models/usuario_login.dart';

class ServicoAutenticacao {

  Future<UsuarioLogin> login(String usuario, String senha) async {
    try {
      http.Response res = await loginApi(usuario, senha);

      if (res.statusCode == 200) {
        // Se sucesso, retorna o usuário
        final usuarioLogin = UsuarioLogin.fromJson(jsonDecode(res.body));
        return usuarioLogin;
      } else if (res.statusCode == 400) {
        throw Exception('Usuário e/ou senha inválidos.');
      } else {
        throw Exception('Erro ao realizar login: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante o login: $e');
    }
  }
}