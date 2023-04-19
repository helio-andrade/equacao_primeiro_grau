import 'package:flutter/material.dart';
import 'solucao.dart';

class EquacaoPage extends StatefulWidget {
  const EquacaoPage({super.key});

  @override
  _EquacaoPageState createState() => _EquacaoPageState();
}

class _EquacaoPageState extends State<EquacaoPage> {
  final TextEditingController _aController = TextEditingController(text: "");
  final TextEditingController _bController = TextEditingController(text: "");
  final TextEditingController _cController = TextEditingController(text: "");
  final Equacao _equacao = Equacao();
  double _resultado = 0.0;
  final _alertKey = GlobalKey();
  final FocusNode aFocus = FocusNode();

  void _calcular() {
    try {
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double c = double.parse(_cController.text);
      double resultado = _equacao.calcular(a, b, c);
      setState(() {
        _resultado = resultado;
      });
    } on Exception catch (e) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          key: _alertKey,
          title: const Text("Erro"),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              focusNode: aFocus,
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _limparCampos() {
    _aController.text = "";
    _bController.text = "";
    _cController.text = "";
    setState(() {
      _resultado = 0.0;
    });
// Foca no primeiro campo
    FocusScope.of(context).requestFocus(aFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ax² + bx + c = 0"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Valor de a
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _aController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "a = ", border: OutlineInputBorder()),
                ),
              ),
              // Valor de b
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _bController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "b = ", border: OutlineInputBorder()),
                ),
              ),
              // Valor de c
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _cController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "c = ", border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: 200.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Botão calcular
                    ElevatedButton(
                      onPressed: _calcular,
                      child: const Text("Calcular"),
                    ),
                    // Botão limpar
                    ElevatedButton(
                      onPressed: _limparCampos,
                      child: const Text("Limpar"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              if (_resultado != 0.0)
                Text(
                  "x = $_resultado",
                  style: const TextStyle(fontSize: 24.0),
                )
            ],
          ),
        ),
      ),
    );
  }
}
