library calendar_widget;

import 'package:calendar_logic/calendar_logic.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final calendarData = CalendarBuilder().build(date);
    return Column(
      children: [
        const _WeekRow(['月', '火', '水', '木', '金', '土', '日']),
        ...calendarData.map(
          (week) => _WeekRow(
            // 日付を文字列に変換。前後の月に所属する日付は null のため、その場合は空文字。
            week.map((date) => date?.toString() ?? '').toList(),
          ),
        ),
      ],
    );
  }
}

class _WeekRow extends StatelessWidget {
  const _WeekRow(this.datesOfWeek);

  final List<String> datesOfWeek;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        datesOfWeek.length,
        (index) => Expanded(
          child: _DateBox(
            datesOfWeek[index],
            weekday: index + 1, // 曜日は 1 始まりなので 1 を足す
          ),
        ),
      ).toList(),
    );
  }
}

class _DateBox extends StatelessWidget {
  const _DateBox(
    this.label, {
    required this.weekday,
  });

  /// 表示文字列（日付の他、「月」「火」といった曜日の場合もあり）
  final String label;

  /// 曜日（土曜日は青、日曜日は赤く塗りつぶす）
  final int weekday;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // 正方形にする
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          color: weekday == 6 // 土曜日は青
              ? Colors.blue.shade50
              : weekday == 7 // 日曜日は赤
                  ? Colors.red.shade50
                  : Colors.white, // その他は白
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
