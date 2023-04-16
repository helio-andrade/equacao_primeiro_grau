import 'package:flutter/material.dart';
import 'equacao_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ax² + bx + c = 0',
      home: EquacaoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
