import 'package:flutter/material.dart';
import 'package:imc_calc/ui/result.dart';


void main() {
  runApp(MaterialApp(
    title: "Calculadora IMC",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //String _textInfo = "";

  void _resetCampos() {
    _formKey.currentState.reset();
    pesoController.clear();
    alturaController.clear();
  }

  void _calcular() {

    String _mensagem = "";
    String _imagem = "";

    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;

    double imc = peso / (altura * altura);

    //debugPrint("$imc");
    if (imc < 18.6) {
      _mensagem = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      _imagem = "images/thin.png";
    }
    else if (imc >= 18.6 && imc < 24.9) {
      _mensagem = "Peso ideal (${imc.toStringAsPrecision(4)})";
      _imagem = "images/shape.png";
    }
    else if (imc >= 24.9 && imc < 29.9) {
      _mensagem = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    }
    else if (imc >= 29.9 && imc < 34.9) {
      _mensagem = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    }
    else if (imc >= 34.9 && imc < 39.9) {
      _mensagem = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    }
    else if (imc >= 40) {
      _mensagem = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        Result(_imagem, _mensagem)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetCampos,
          )
        ], //<Widget>[]
      ), // app bar
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120, color: Colors.blueAccent),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: pesoController,
                validator: (value) {
                  if (value.isEmpty) return "Insira seu peso!";
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: alturaController,
                validator: (value) {
                  if (value.isEmpty) return "Insira sua altura!";
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          _calcular();
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.blueAccent,
                    )),
              ),
            ], //<widget>[]
          ),
        ),
      ),
    );
  }
}
