import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_calc/buttons.dart';
import 'package:ui_calc/calculator_screen.dart';

void main() {
  testWidgets('CalculactorScreen widget test', (WidgetTester tester) async {
    // Create the CalculactorScreen widget
    await tester.pumpWidget(const MaterialApp(
      home: CalculactorScreen(),
    ));

    // Find the CalculactorScreen widget
    final screen = find.byType(CalculactorScreen);
    expect(screen, findsOneWidget);

    // Find the Buttons widget within CalculactorScreen
    final button = find.byType(Buttons);
    expect(button, findsWidgets);

    // Test user input and output display
    final userInput = find.text('0');
    expect(userInput, findsOneWidget);

    final userOutput = find.text('');
    expect(userOutput, findsOneWidget);
  });
}
