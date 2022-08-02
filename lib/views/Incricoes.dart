import 'package:flutter/material.dart';

class Incricoes extends StatefulWidget {
  const Incricoes({Key? key}) : super(key: key);

  @override
  State<Incricoes> createState() => _IncricoesState();
}

class _IncricoesState extends State<Incricoes> {
  final style = TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Incrições", style: style,),
      ),
    );
  }
}