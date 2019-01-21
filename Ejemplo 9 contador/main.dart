import 'package:flutter/material.dart';

void main() => runApp(MyStatefulApp());

/* Diferencia entre StatelessWidget & StatefulWidget 
 * Resumen un numero que aumenta : contador++;
 * 
 * StatelessWidget Ocurre que el estado no cambia
 *  Este se pinta cuando se crea.
 * 
 * En cambio con StatefulWidget tiene un estado el cual puede cambiar
 * cambia cuando uno le indica
 */
class MyStatelessApp extends StatelessWidget {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget"),
        ),
        body: Column(
          children: <Widget>[Text(contador.toString())],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () {
            contador++;
            print(contador);
          },
        ),
      ),
    );
  }
}

class MyStatefulApp extends StatefulWidget {
  @override
  _MyStatefulAppState createState() => _MyStatefulAppState();
  //El estado de nuestro widget
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget"),
        ),
        body: Column(
          children: <Widget>[
            new Container( //centro el texto completo en el container
              alignment: Alignment.center,
              margin: new EdgeInsets.only(
                top: 50.0
              ),
            ),
            Text(
              contador.toString(),
              style: const TextStyle( //formato a las las letras 
                fontSize: 200.0,
                color:  Colors.red,
                fontWeight: FontWeight.w600,
              ),
              
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red, //cambio de color del boton
          foregroundColor: Colors.blue, //color interno , pero predomina el interno

          child: Icon(
            Icons.plus_one,
            size: 40.0, //tamaño de la letra interna del boton
            color: Colors.yellow, //si le asigno un color por encima, este predomina
          ),

          onPressed: () { // si presionamos el botón  cambia el estado
            setState(() {  //Esta función cambia de estado, repinta la accion
              contador++;
              print(contador);
            });
          },
        ),
      ),
    );
  }
}
