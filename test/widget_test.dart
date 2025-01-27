import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_flutter_web/main.dart';  // Caminho para o arquivo main.dart

void main() {
  testWidgets('Testar se a Calculadora funciona corretamente', (WidgetTester tester) async {
    // Carregar o aplicativo
    await tester.pumpWidget(CalculadoraApp());

    // Testar o layout inicial (certificar-se de que os botões estão presentes)
    expect(find.text('0'), findsOneWidget);  // Verificar se o resultado inicial é 0

    // Pressionar o botão '1'
    await tester.tap(find.text('1'));
    await tester.pump();  // Atualizar a tela

    // Verificar se o '1' apareceu na entrada
    expect(find.text('1'), findsOneWidget);

    // Pressionar o botão '+' para somar
    await tester.tap(find.text('+'));
    await tester.pump();

    // Pressionar o botão '2'
    await tester.tap(find.text('2'));
    await tester.pump();

    // Verificar se a entrada ficou correta: "1+2"
    expect(find.text('1+2'), findsOneWidget);

    // Pressionar o botão '=' para realizar o cálculo
    await tester.tap(find.text('='));
    await tester.pump();

    // Verificar se o resultado da soma aparece corretamente
    expect(find.text('3'), findsOneWidget);  // Resultado da soma deve ser 3

    // Testar o botão 'C' para limpar a entrada
    await tester.tap(find.text('C'));
    await tester.pump();

    // Verificar se a entrada e o resultado foram resetados
    expect(find.text('0'), findsOneWidget);  // Verificar se o resultado voltou a ser 0
  });

  testWidgets('Testar operação de subtração', (WidgetTester tester) async {
    // Carregar o aplicativo
    await tester.pumpWidget(CalculadoraApp());

    // Pressionar o botão '5'
    await tester.tap(find.text('5'));
    await tester.pump();

    // Pressionar o botão '-'
    await tester.tap(find.text('-'));
    await tester.pump();

    // Pressionar o botão '3'
    await tester.tap(find.text('3'));
    await tester.pump();

    // Verificar se a entrada ficou correta: "5-3"
    expect(find.text('5-3'), findsOneWidget);

    // Pressionar o botão '=' para realizar o cálculo
    await tester.tap(find.text('='));
    await tester.pump();

    // Verificar se o resultado da subtração aparece corretamente
    expect(find.text('2'), findsOneWidget);  // Resultado da subtração deve ser 2
  });

  testWidgets('Testar operação de multiplicação', (WidgetTester tester) async {
    // Carregar o aplicativo
    await tester.pumpWidget(CalculadoraApp());

    // Pressionar o botão '6'
    await tester.tap(find.text('6'));
    await tester.pump();

    // Pressionar o botão '*'
    await tester.tap(find.text('*'));
    await tester.pump();

    // Pressionar o botão '4'
    await tester.tap(find.text('4'));
    await tester.pump();

    // Verificar se a entrada ficou correta: "6*4"
    expect(find.text('6*4'), findsOneWidget);

    // Pressionar o botão '=' para realizar o cálculo
    await tester.tap(find.text('='));
    await tester.pump();

    // Verificar se o resultado da multiplicação aparece corretamente
    expect(find.text('24'), findsOneWidget);  // Resultado da multiplicação deve ser 24
  });

  testWidgets('Testar operação de divisão', (WidgetTester tester) async {
    // Carregar o aplicativo
    await tester.pumpWidget(CalculadoraApp());

    // Pressionar o botão '8'
    await tester.tap(find.text('8'));
    await tester.pump();

    // Pressionar o botão '/'
    await tester.tap(find.text('/'));
    await tester.pump();

    // Pressionar o botão '2'
    await tester.tap(find.text('2'));
    await tester.pump();

    // Verificar se a entrada ficou correta: "8/2"
    expect(find.text('8/2'), findsOneWidget);

    // Pressionar o botão '=' para realizar o cálculo
    await tester.tap(find.text('='));
    await tester.pump();

    // Verificar se o resultado da divisão aparece corretamente
    expect(find.text('4'), findsOneWidget);  // Resultado da divisão deve ser 4
  });
}
