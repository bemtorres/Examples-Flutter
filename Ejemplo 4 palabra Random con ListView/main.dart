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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Bienvenidos Example 4 ListView"),
        ),
        body: _buildSuggestions(),
    );
  }
  
  Widget _buildSuggestions(){
    //Parametro que se crean los elementos
    return ListView.builder(
      itemBuilder: (context, i){
        if(i>= _suggestions.length){
          //Se agregaran mas a la lista de palabras cuando llegue al final
          
          _suggestions.addAll(generateWordPairs().take(10));
        }
        //Objeto visualizar
        return _buildRow(_suggestions[i]);
      },
    );
  }
  

  Widget _buildRow(WordPair pair){
    return ListTile(
      title : Text (pair.asPascalCase),
    );
  }
}