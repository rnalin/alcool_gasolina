import 'package:flutter/material.dart';



class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calculate (){

    double _valorAlcool = double.tryParse(_controllerAlcool.text);
    double _valorGasolina = double.tryParse(_controllerGasolina.text);

    if(_valorAlcool == null || _valorGasolina == null){
      setState(() {
        _resultado = ("Número inválido. Digite número maior que 0 e utilizando (.)");
      });
    }  else{

      if( (_valorAlcool / _valorGasolina) >= 0.7 ){
        setState(()
        { _resultado = ("É melhor abastecer com gasolina.");});
      }
      else{
        setState(() {
          _resultado = ("É melhor abastecer com álcool.");
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos (){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: (
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset("imagens/logo.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text("Saiba qual melhor opção para abastecer o seu carro:",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        labelText: "Preço Álcool: ex: 1.98"
                    ),
                    style: TextStyle(
                        fontSize: 24
                    ),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        labelText: "Preço Gasolina: ex: 3.95"
                    ),
                    style: TextStyle(
                        fontSize: 24
                    ),
                    controller: _controllerGasolina,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: RaisedButton(
                      child: Text("Calcular",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12),
                      onPressed: _calculate,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(_resultado,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  )
                ],
              )
          ),
        )
      ) ,

    );
  }
}
