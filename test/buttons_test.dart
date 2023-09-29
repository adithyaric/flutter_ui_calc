import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_calc/buttons.dart';

void main() {
  testWidgets('Buttons widget test', (WidgetTester tester) async {
    // Define a callback function
    var tapped = false;
    void onTap() {
      tapped = true;
    }

    // Create the Buttons widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Buttons(
          buttonText: 'Test',
          color: Colors.red,
          textColor: Colors.white,
          buttontapped: onTap,
        ),
      ),
    ));

    // Find the Buttons widget
    final button = find.byType(Buttons);
    expect(button, findsOneWidget);

    // Tap on the Buttons widget
    await tester.tap(button);
    await tester.pump();

    // Verify the callback function has been executed
    expect(tapped, true);
  });
}
