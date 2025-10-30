import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/audiobook.dart';
import 'player_screen.dart';

class BookInLibraryScreen extends StatefulWidget {
  final AudioBook book;
  final VoidCallback onBack;

  const BookInLibraryScreen({
    super.key,
    required this.book,
    required this.onBack,
  });

  @override
  State<BookInLibraryScreen> createState() => _BookInLibraryScreenState();
}

class _BookInLibraryScreenState extends State<BookInLibraryScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  final List<Map<String, String>> comments = [
    {
      'user': 'Ryan Dang',
      'comment':
          'Phần thứ ba của Harry Potter thật sự cuốn hút với cốt truyện kịch tính và nhiều tình tiết bất ngờ.'
    },
    {
      'user': 'Tony Bui',
      'comment':
          '“Việt Nam sử lược” là một cuốn sách tuyệt vời giúp người đọc hiểu rõ lịch sử dân tộc.'
    },
  ];

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
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
              // Nút quay lại
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: widget.onBack,
              ),

              // Ảnh bìa
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.book.coverUrl,
                    width: 180,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Nút phát
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  label: Text(
                    isPlaying ? 'pause'.tr() : 'play'.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(book: widget.book),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1E3C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Tiêu đề tóm tắt
              Text(
                'book_summary'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                'summary_text'.tr(),
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 30),

              // Tiêu đề bình luận
              Text(
                'comments'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Danh sách bình luận
              ...comments.map((c) => Card(
                    color: const Color(0xFF1E1E3C),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF2C2C54),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        c['user']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        c['comment']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  )),

              const SizedBox(height: 16),

              // Ô nhập bình luận
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E3C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'enter_comment'.tr(),
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    suffixIcon: const Icon(Icons.send, color: Colors.white),
                  ),
                  onSubmitted: (value) {
                    if (value.trim().isNotEmpty) {
                      setState(() {
                        comments.add({
                          'user': 'You',
                          'comment': value.trim(),
                        });
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
