import 'package:hive/hive.dart';
import '../models/audiobook.dart';

class AppDatabase {
  static Box<AudioBook> get box => Hive.box<AudioBook>('books');

  static Future<void> insertBook(AudioBook book) async {
    await box.add(book);
  }

  static List<AudioBook> getBooks() {
    return box.values.toList();
  }

  static Future<void> deleteBook(int key) async {
    await box.delete(key);
  }

  static Future<void> clearDatabase() async {
    await box.clear();
  }

  static Future<void> insertSampleBooks() async {
    if (box.isEmpty) {
      await insertBook(AudioBook(
        title: 'Tuổi Trẻ Đáng Giá Bao Nhiêu',
        author: 'Rosie Nguyễn',
        coverUrl: 'assets/images/vogiadinh.jpg',
        audioUrl: 'assets/audios/vogiadinh.mp3',
      ));
      await insertBook(AudioBook(
        title: 'Đắc Nhân Tâm',
        author: 'Dale Carnegie',
        coverUrl: 'assets/images/vogiadinh.jpg',
        audioUrl: 'assets/audios/vogiadinh.mp3',
      ));
      await insertBook(AudioBook(
        title: 'Bí mật của may mắn',
        author: 'Alex Rovira & Fernando Trías de Bes',
        coverUrl: 'assets/images/vogiadinh.jpg',
        audioUrl: 'assets/audios/vogiadinh.mp3',
      ));
    }
  }
}
