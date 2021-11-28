// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_project/main.dart';
import 'package:test_project/screens/user_screen/user_screen.dart';

void main() {
  testWidgets('Should find UserScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyApp()));
    await tester.pumpAndSettle();

    expect(find.byType(UserScreen), findsOneWidget);
  });
}
