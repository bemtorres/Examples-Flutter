import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Biblioteca para palabras ramdon

    return MaterialApp(
      title: "Example 4 ListView",
      home: RandomWords(),
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
  final _suggestions = <WordPair>[];
  //cambiar fuente
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Bienvenidos Example 5 ListView"),
        ),
        body: _buildSuggestions(),
    );
  }
  
  Widget _buildSuggestions(){
    //Parametro que se crean los elementos
    return ListView.builder(
      //mover un poco 
      padding: const EdgeInsets.all(16.0),

      itemBuilder: (context, i){
        
        if(i.isOdd){ //es impar
          return Divider(
            color: Colors.red,
          );
        }
        if(i>= _suggestions.length){
          //Se agregaran mas a la lista de palabras cuando llegue al final          
          _suggestions.addAll(generateWordPairs().take(10));
        }
        //Objeto visualizar


        final index = i ~/ 2;
        return _buildRow(_suggestions[index]);
      },
    );
  }
  

  Widget _buildRow(WordPair pair){
    return ListTile(
      title : Text (
        pair.asPascalCase,
        style: _biggerFont, //texto mas grande
      ),
    );
  }
}