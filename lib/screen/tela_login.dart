import 'package:flutter/material.dart';


class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Opacity(
              opacity: 0.4, 
              child: Icon(Icons.person_3_rounded, size: 100, color: Colors.indigoAccent),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ID do SIDINEY',
                    prefixIcon: Icon(Icons.pan_tool_sharp),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: (){},
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: (){},
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text("Entrar"),
                  onPressed: (){},
                  ),
                )
          ],
          )
      ),
    );
  }
}