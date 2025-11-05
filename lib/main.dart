import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'models/audiobook.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Hive
  await Hive.initFlutter();
  Hive.registerAdapter(AudioBookAdapter());
  var box = await Hive.openBox<AudioBook>('books');

  // (Tùy chọn) Xóa toàn bộ sách cũ
  await box.clear();

  // Khởi tạo EasyLocalization
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('vi'), // Tiếng Việt
        Locale('en'), // Tiếng Anh
      ],
      path: 'assets/langs', // Thư mục chứa file ngôn ngữ
      fallbackLocale: const Locale('vi'), // Ngôn ngữ mặc định
      child: const AudioBookApp(),
    ),
  );
}

class AudioBookApp extends StatelessWidget {
  const AudioBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Book App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF0F0F29),
      ),

      // Thêm các delegate & locale vào đây để EasyLocalization hoạt động
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: const SplashScreen(),
    );
  }
}
