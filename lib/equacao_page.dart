import 'package:flutter/material.dart';
import 'solucao.dart';

class EquacaoPage extends StatefulWidget {
  @override
  _EquacaoPageState createState() => _EquacaoPageState();
}

class _EquacaoPageState extends State<EquacaoPage> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final EquacaoPrimeiroGrau _equacao = EquacaoPrimeiroGrau();
  double _resultado = 0.0;

  void _calcular() {
    try {
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double resultado = _equacao.calcular(a, b);
      setState(() {
        _resultado = resultado;
      });
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Erro"),
                content: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equação do 1º grau"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o valor de a",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o valor de b",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 16.0),
            if (_resultado != null)
              Text(
                "x = $_resultado",
                style: TextStyle(fontSize: 24.0),
              )
          ],
        ),
      ),
    );
  }
}
