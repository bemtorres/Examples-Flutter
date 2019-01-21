import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Biblioteca para palabras ramdon
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Example 7 Guardado Favorito",
      theme: ThemeData(
        primaryColor: Colors.green,

      ),
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
  //lista de palabras en ingles
  final _suggestions = <WordPair>[];
  //lista de favoritos
  final _save = Set<WordPair>();
  //cambiar fuente
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Example 7 Guardado Favorito"),

          //icono al lado del titulo 
          actions: <Widget>[
            IconButton(
              icon:  Icon(Icons.list), //icono de lista
              onPressed: _pushSaved, // funcion cuando haga click
            )
          ],
        ),
        body: _buildSuggestions(),
    );
  }

  //funcion que envia a una nueva ventana (Ruta)
  void _pushSaved(){
    //para pasar la nueva ruta
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          final tiles = _save.map((pair){  //el objeto navigator . se crea una nueva ruta con materialPageRoute,
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
      });

      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Guardar Favoritos!'),
        ) ,
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
  
  Widget _buildSuggestions(){
    //Parametro que se crean los elementos
    return ListView.builder(
      //mover un poco 
      padding: const EdgeInsets.all(16.0),

      itemBuilder: (context, i){
        
        if(i.isOdd){ //es impar
          return Divider(
            color: Colors.blue,
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
    //esta en el set de palabras elegidas
    final estaSave = _save.contains(pair);

    return ListTile(
      title : Text (
        pair.asPascalCase,
        style: _biggerFont, //texto mas grande
      ),
      trailing: Icon(
        //si esta en la lista corazon relleno y si no sin relleno
        estaSave ? Icons.favorite : Icons.favorite_border,
        //si esta en la lista corazon rojo y si no sin nada
        color: estaSave ? Colors.red: null,
      ),
      // si se apreta OnClickListener
      onTap: (){
        setState(() {
          if(estaSave){
            _save.remove(pair);
          } else{
            _save.add(pair);
          }
        });
      },
    );
  }
}