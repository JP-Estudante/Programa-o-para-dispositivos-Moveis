import 'package:flutter/material.dart';
import 'package:my_app/models/usuario_login.dart';
import 'package:my_app/screen/tela_principal.dart';
import 'package:my_app/services/servico_autenticacao.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController(text: 'emilys');
  final senhaController = TextEditingController(text: 'emilyspass');
  bool fazendoLogin = false;

  final servicoAutenticacao = ServicoAutenticacao();

  Future<void> registraLogin() async {
    setState(() {
      fazendoLogin = true;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Processando Login')));

    try {
      final UsuarioLogin = await servicoAutenticacao.login(
          usuarioController.text, senhaController.text);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (UsuarioLogin != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaPrincipal()));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ));
    } finally {
      setState(() {
        fazendoLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Opacity(
                opacity: 0.4,
                child: Icon(Icons.person_3_rounded,
                    size: 100, color: Colors.indigoAccent),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: TextFormField(
                  controller: usuarioController,
                  decoration: InputDecoration(
                      labelText: 'Usuario',
                      prefixIcon: Icon(Icons.pan_tool_sharp),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: fazendoLogin
                      ? CircularProgressIndicator()
                      : Text("Entrar"),
                  onPressed: fazendoLogin ? null : registraLogin,
                ),
              )
            ],
          )),
    );
  }
}
