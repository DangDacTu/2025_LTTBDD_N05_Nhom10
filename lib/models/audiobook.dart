import 'package:hive/hive.dart';

part 'audiobook.g.dart';

@HiveType(typeId: 0)
class AudioBook extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String author;
  @HiveField(2)
  String coverUrl;
  @HiveField(3)
  String audioUrl;

  AudioBook({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.audioUrl,
  });
}

final List<AudioBook> demoBooks = [
  AudioBook(
    title: "Tuổi Trẻ Đáng Giá Bao Nhiêu",
    author: "Rosie Nguyễn",
    coverUrl: "assets/images/tuoitre.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Sử ký Tư Mã Thiên",
    author: "Dale Carnegie",
    coverUrl: "assets/images/tumathien.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "ngọc trong đá",
    author: "Jeffrey Archer",
    coverUrl: "assets/images/ngoninda.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Việt Nam Sử Ký",
    author: "Dale Carnegie",
    coverUrl: "assets/images/vnsu.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Kiếp sau",
    author: "Dale Carnegie",
    coverUrl: "assets/images/kiepsau.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Trên đỉnh phố Wall",
    author: "Dale Carnegie",
    coverUrl: "assets/images/wall.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Nhà chử",
    author: "Paulo Coelho",
    coverUrl: "assets/images/nhachu.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Sự suy tàn của quyền lực",
    author: "Alex Rovira & Fernando Trías de Bes",
    coverUrl: "assets/images/quyenluc.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "vì nghĩa vì tình",
    author: "Ichiro Kishimi & Fumitake Koga",
    coverUrl: "assets/images/nghiatinh.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Không gia đình",
    author: "Hector Malot",
    coverUrl: "assets/images/vogiadinh.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Đảo giấu vàng",
    author: "J.K. Rowling",
    coverUrl: "assets/images/daovang.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Con nhà giàu",
    author: "J.K. Rowling",
    coverUrl: "assets/images/giau.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Đẹp và buồn",
    author: "J.K. Rowling",
    coverUrl: "assets/images/depbuon.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
  AudioBook(
    title: "Sherlock Holmes",
    author: "J.K. Rowling",
    coverUrl: "assets/images/conan.jpg",
    audioUrl: "vogiadinh.mp3",
  ),
];
