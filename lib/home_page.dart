import 'package:flutter/material.dart';
import 'package:youtube/models/CustomSearchDelegate.dart';
import 'package:youtube/views/Bibliotecas.dart';
import 'package:youtube/views/Incricoes.dart';
import 'package:youtube/views/emalta.dart';
import 'package:youtube/views/inicio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final style = TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);

  int indice_atual = 0;
  var _resultado = "";

  @override
  Widget build(BuildContext context) {

    

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Incricoes(),
      Bibliotecas()
      
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.black,
        title: Image.asset("images/wasdgames.png"),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),

          IconButton(onPressed: () async {
            var res = await showSearch(context: context, delegate: CustomSearchDelegate());
            print("Resultado: " + res.toString());
            setState(() {
              _resultado = res.toString();
            });
          }, icon: Icon(Icons.search)),

          // IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        ],
      ),

      body: Container(
        
        child: telas[indice_atual],
      ),

      backgroundColor: Colors.black,

      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: indice_atual,
        onTap: (indice) {
          setState(() {
            indice_atual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home_filled)
            ),

          BottomNavigationBarItem(
            label: 'Em alta',
            icon: Icon(Icons.whatshot)
            ),

          BottomNavigationBarItem(
            label: 'Inscrições',
            icon: Icon(Icons.subscriptions_outlined, size: 24,)
            ),

          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder_open)
            ),
        ],
      ),
    );
  }
}