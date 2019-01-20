import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Biblioteca para palabras ramdon

    return MaterialApp(
      title: "Example 3",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenidos Example 3 "),
        ),
        body: Center(
          //Generar Palabra Ramdom ... de las dos formas con $ o +
          child: RandomWords(),
          
        ),
      ),
    );
  }
}

//Mutable
class RandomWords extends StatefulWidget{
  @override  
  State<StatefulWidget> createState() {    
    return RandomWordsState();
  }

}
//Persiste entre render
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    final _palabra = new WordPair.random();
    return Text(_palabra.asPascalCase);
  }

}