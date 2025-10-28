import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/audiobook.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AudioBookAdapter());
  var box = await Hive.openBox<AudioBook>('books');

  // Xóa toàn bộ sách đã lưu trong Hive
  await box.clear();

  runApp(const AudioBookApp());
}

class AudioBookApp extends StatelessWidget {
  const AudioBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Book App',
      debugShowCheckedModeBanner: false, // Thêm dòng này để ẩn chữ debug
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF0F0F29),
      ),
      home: const SplashScreen(),
    );
  }
}
