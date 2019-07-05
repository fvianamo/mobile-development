import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(title: "Contador de Pessoas", home: Home()));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _pessoas = 0;
  String _mensagem = "Pode entrar";

  void _changePeople(int delta){
    setState(() {
      _pessoas += delta;
      _mensagem = "Pode entrar";
      if (_pessoas > 10) {
        _pessoas = 10;
        _mensagem = "NÃO PODE ENTRAR";
      }else if (_pessoas < 1) {
        _pessoas = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("Imagens/restaurante.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Serumaninhos: $_pessoas",
              style:
              TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: (){
                        _changePeople(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(onPressed: (){
                    _changePeople(-1);
                  },
                    child: Text(
                      "-1",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white
                      ),
                    )),
                ),
              ],
            ),
            Text(
              "$_mensagem",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 25.0
              ),
            )
          ],
        )
      ],
    );
  }
}
