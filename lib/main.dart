import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _resultado = "0";  // Resultado da calculadora
  String _entrada = "";    // Entrada do usuário

  // Função que é chamada sempre que o botão é pressionado
  void _botaoPressionado(String texto) {
    setState(() {
      if (texto == "=") {
        // Aqui calculamos a expressão
        try {
          _resultado = _calcularExpressao(_entrada);
        } catch (e) {
          _resultado = "Erro";
        }
        _entrada = "";
      } else if (texto == "C") {
        _entrada = "";
        _resultado = "0";
      } else {
        _entrada += texto;
      }
    });
  }

  // Função simples para calcular a expressão
  String _calcularExpressao(String expressao) {
    // Aqui você pode adicionar uma implementação mais robusta
    try {
      final resultado = _evalExpressao(expressao);
      return resultado.toString();
    } catch (e) {
      return "Erro";
    }
  }

  // Função para avaliar a expressão simples
  double _evalExpressao(String expressao) {
    // Para fins de simplicidade, a expressão será apenas convertida para um double
    // e somada diretamente.
    return double.tryParse(expressao) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Flutter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Tela de entrada
            Text(
              _entrada,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              _resultado,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Layout dos botões da calculadora
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    String textoBotao = "";
                    if (index < 9) {
                      textoBotao = (index + 1).toString();
                    } else if (index == 9) {
                      textoBotao = "0";
                    } else if (index == 10) {
                      textoBotao = "+";
                    } else if (index == 11) {
                      textoBotao = "-";
                    } else if (index == 12) {
                      textoBotao = "=";
                    } else if (index == 13) {
                      textoBotao = "/";
                    } else if (index == 14) {
                      textoBotao = "*";
                    } else if (index == 15) {
                      textoBotao = "C";
                    }
                    _botaoPressionado(textoBotao);
                  },
                  child: Text(
                    index < 9 ? (index + 1).toString() : ["+", "-", "=", "/", "*", "C"][index - 9],
                    style: TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
