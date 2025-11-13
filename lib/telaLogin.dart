import 'package:aula1/telaCadastro.dart';
import 'package:flutter/material.dart';
import 'package:aula1/home.dart';
import 'package:aula1/database/usuarioDAO.dart';

class telaLogin extends StatefulWidget {
  @override
  State<telaLogin> createState() => telaLoginState();
}

class telaLoginState extends State<telaLogin>{
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool _darkTheme = false;

  Color get _backgroundColor => _darkTheme ? Colors.indigo : Colors.white;
  Color get _textColor => _darkTheme ? Colors.white : Colors.black;

  // 3. THEME TOGGLE FUNCTION: Updates the state and triggers a rebuild
  void _toggleTheme() {
    setState(() {
      _darkTheme = !_darkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Compracax 2000',
          style: TextStyle(color: _textColor),
        ),
        backgroundColor: _backgroundColor,
      ),
      body: Container(
        width: double.infinity,
        color: _backgroundColor,
        child: Column(
          children: [
            SizedBox(
                height: 10
            ),
            Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 3
                ),
                color: _backgroundColor,
              ),
              child: Image.asset('assets/compracax.png', height: 120),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Logue em Sua Conta!',
              style: TextStyle(color: _textColor, fontSize: 30),
              textDirection: TextDirection.ltr,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  icon:  Icon(Icons.email, color: Colors.black),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  icon:  Icon(Icons.password, color: Colors.black),
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        final autorizado = await UsuarioDAO.autenticar(usuarioController.text, senhaController.text);
                        if(autorizado) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => telaHome())
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Usuário e/ou senha inválido(s)!'),
                                backgroundColor: Colors.redAccent,)
                          );
                        }
                      }, child: Text('Entrar', style: TextStyle(fontSize: 16, color: Colors.black54))),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => telaCadastro())
                        );
                      }, child: Text('Cadastre-se', style: TextStyle(fontSize: 16, color: Colors.black54))),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: _toggleTheme, child: Text('Tema Escuro', style: TextStyle(fontSize: 16, color: Colors.black54)))
          ]
        )
      ),
        bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.app_registration_rounded), label: 'Cadastre-se'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login')
        ]),
    );
  }

}