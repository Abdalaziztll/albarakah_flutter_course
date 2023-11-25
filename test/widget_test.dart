import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_and_test/main.dart';

void main() {
  test('Test for mathmatic logic', () {
    double x = 3;

    expect(x, 2 + 1);
  });

  group('testing for widgets', () {
    testWidgets('test for switch', (widgetTester) async {
      final switchTest = find.byKey(ValueKey('test switch'));

      await widgetTester.pumpWidget(MaterialApp(home: HomePage()));

      await widgetTester.enterText(
          find.byKey(ValueKey('username')), 'Easy Tester');

      await widgetTester.tap(switchTest);
    });
  });
}
