import 'package:aula1/database/restaurante.dart';
import 'package:aula1/database/restauranteDAO.dart';
import 'package:aula1/database/usuarioDAO.dart';
import 'package:flutter/material.dart';

class telaHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => telaHomeState();
}

class telaHomeState extends State<telaHome> {
  final nome = UsuarioDAO.usuarioLogado.nome;

  List<Restaurante> restaurantes = [];

  Future<void> carregaRestaurantes() async {
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurantes = lista;
    });
  }
  void initState() {
    super.initState();
    carregaRestaurantes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
          title: Text('Compracax 2000!', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey,
          actions: [
            Icon(Icons.person)
          ]
      , centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
          child:
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: ImagensSlider(),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: restaurantes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final restaurante = restaurantes[index];
                      return ElevatedButton(
                          onPressed: () {},
                          child: Text(restaurante.nome ?? 'Sem Nome')
                      );
                    },
                  ),
                ),
              ],
            )
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded), label: 'Restaurantes'),
        BottomNavigationBarItem(icon: Icon(Icons.discount), label: 'Cupons'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Endereços'),
      ])
    );
  }
}

class ImagensSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (final color in Colors.primaries)
          Container(width: 150, color: color),
      ],
    );
  }
}

