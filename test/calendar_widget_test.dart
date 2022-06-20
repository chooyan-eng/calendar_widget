import 'package:calendar_widget/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Widget Test', () {
    const calendarWidgetKey = Key('calendar_widget');

    late DateTime date = DateTime(2022, 6, 1, 0, 0);

    MaterialApp app = MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Calendar(key: calendarWidgetKey, date: date),
            ],
          ),
        ),
      ),
    );

    testWidgets('Calendar widget has a label on 2022/06',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);

      // 初期値
      expect(find.byKey(calendarWidgetKey), findsOneWidget);
      expect(find.text('月'), findsOneWidget);
      expect(find.text('火'), findsOneWidget);
      expect(find.text('水'), findsOneWidget);
      expect(find.text('木'), findsOneWidget);
      expect(find.text('金'), findsOneWidget);
      expect(find.text('土'), findsOneWidget);
      expect(find.text('日'), findsOneWidget);
    });

    testWidgets('Calendar widget has a date on 2022/06',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);

      // 初期値
      for (var i = 1; i <= 30; i++) {
        expect(find.text('$i'), findsOneWidget);
      }
    });
  });
}
