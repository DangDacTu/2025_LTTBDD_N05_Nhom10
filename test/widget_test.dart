import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:audio_book/main.dart';

void main() {
  testWidgets('App starts smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const AudioBookApp());

    // Verify that the SplashScreen is displayed
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Audio Book App'), findsNothing); // tên app, không cần hiển thị text

    // Bạn có thể kiểm tra xem SplashScreen có widget nào đặc trưng
    // Ví dụ:
    // expect(find.text('Chào mừng'), findsOneWidget);
  });
}
