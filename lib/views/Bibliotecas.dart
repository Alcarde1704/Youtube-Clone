import 'package:flutter/material.dart';

class Bibliotecas extends StatefulWidget {
  const Bibliotecas({Key? key}) : super(key: key);

  @override
  State<Bibliotecas> createState() => _BibliotecasState();
}

class _BibliotecasState extends State<Bibliotecas> {
  final style = TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Biblioteca", style: style,),
      ),
    );
  }
}