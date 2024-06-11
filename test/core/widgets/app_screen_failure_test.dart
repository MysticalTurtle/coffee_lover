import 'package:coffee_lover/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays error message', (WidgetTester tester) async {
    // Arrange: Pump the widget into the widget tree
    await tester.pumpWidget(
      const MaterialApp(
        home: AppScreenFailure(),
      ),
    );

    // Act & Assert: Verify the text is displayed
    expect(find.text('Something went wrong!'), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
