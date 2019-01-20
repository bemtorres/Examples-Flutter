import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Biblioteca para palabras ramdon
    final _palabra = new WordPair.random();

    return MaterialApp(
      title: "Example 2",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenidos"),
        ),
        body: Center(
          //Generar Palabra Ramdom ... de las dos formas con $ o +
          child: Text("Hola ${_palabra.asPascalCase} " /*+ _palabra.asPascalCase */),
          
        ),
      ),
    );
  }
}
