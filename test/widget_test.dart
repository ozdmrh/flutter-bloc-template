// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_bloc_template/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(ListView), findsOneWidget);
    await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Card));
    await tester.pump();

    expect(find.byIcon(Icons.podcasts_outlined), findsOneWidget);
  });
}
