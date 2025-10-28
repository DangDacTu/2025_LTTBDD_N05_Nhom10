import 'package:flutter/material.dart';
import '../models/audiobook.dart';
import 'package:audioplayers/audioplayers.dart';
import 'player_screen.dart';
import '../database/app_database.dart';

class BookDetailScreen extends StatefulWidget {
  final AudioBook book;
  final VoidCallback onBack;
  const BookDetailScreen({super.key, required this.book, required this.onBack});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  bool isSaved = false;

  final List<Map<String, String>> comments = [
    {
      'user': 'Ryan Dang',
      'comment':
          'Phần thứ ba của Harry Potter thật sự cuốn hút với cốt truyện kịch tính và nhiều tình tiết bất ngờ.'
    },
    {
      'user': 'Tony Bui',
      'comment':
          '“Việt Nam sử lược” giúp người đọc hiểu rõ lịch sử dân tộc, văn phong rất dễ hiểu và cảm xúc.'
    },
  ];

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _saveBook() async {
    await AppDatabase.insertBook(widget.book);
    setState(() => isSaved = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã lưu sách vào thư viện!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Nút back ---
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: widget.onBack,
              ),
              const SizedBox(height: 10),

              // --- Ảnh bìa sách ---
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.book.coverUrl,
                    width: 200,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Tên và tác giả ---
              Center(
                child: Column(
                  children: [
                    Text(
                      widget.book.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.book.author,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // --- Nút phát và lưu ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    label: Text(
                      isPlaying ? 'Tạm dừng' : 'Phát',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B3B6D),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlayerScreen(book: widget.book),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                    ),
                    label: Text(
                      isSaved ? 'Đã lưu' : 'Lưu',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B3B6D),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: isSaved ? null : _saveBook,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- Tóm tắt ---
              const Text(
                'Tóm tắt sách',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '“Việt Nam sử lược” là cuốn sách lịch sử đầu tiên viết bằng chữ Quốc ngữ, do Trần Trọng Kim biên soạn và xuất bản năm 1920...',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 30),

              // --- Bình luận ---
              const Text(
                'Bình luận',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              ...comments.map((c) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1B3A),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF3B3B6D),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        c['user']!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        c['comment']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),

              // --- Nhập bình luận ---
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nhập bình luận của bạn...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF1B1B3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon:
                      const Icon(Icons.send, color: Color(0xFF8F8FFF)),
                ),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    setState(() {
                      comments.add({'user': 'Bạn', 'comment': value.trim()});
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
