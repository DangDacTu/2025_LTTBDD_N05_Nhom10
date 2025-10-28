import 'package:flutter/material.dart';
import '../models/audiobook.dart';
import '../widgets/book_card.dart';
import 'setting_screen.dart';

class HomeScreen extends StatelessWidget {
  final void Function(AudioBook) onBookTap;
  const HomeScreen({super.key, required this.onBookTap});

  @override
  Widget build(BuildContext context) {
    final books = demoBooks;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F29),
        elevation: 0,
        title: const Text(
          'AudioBooks.',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DANH MỤC
            const Text(
              'Danh mục',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategory('Nghệ thuật'),
                  _buildCategory('Kinh doanh'),
                  _buildCategory('Tiểu sử'),
                  _buildCategory('Hài'),
                  _buildCategory('Giáo dục'),
                  _buildCategory('Tâm lý'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 ĐỀ XUẤT CHO BẠN
            _buildSectionTitle('Đề xuất cho bạn'),
            const SizedBox(height: 8),
            _buildImageList(books),

            const SizedBox(height: 24),

            // 🔹 BÁN CHẠY
            _buildSectionTitle('Bán chạy'),
            const SizedBox(height: 8),
            _buildBestSellerList(books),

            const SizedBox(height: 24),

            // 🔹 MỚI PHÁT HÀNH
            _buildSectionTitle('Mới phát hành'),
            const SizedBox(height: 8),
            _buildImageList(books),

            const SizedBox(height: 24),

            // 🔹 PHỔ BIẾN HIỆN HÀNH
            _buildSectionTitle('Phổ biến hiện nay'),
            const SizedBox(height: 8),
            _buildImageList(books),
          ],
        ),
      ),
    );
  }

  // ======= WIDGET PHỤ =======
  Widget _buildCategory(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A5E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(name, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('Xem thêm', style: TextStyle(color: Colors.blueAccent)),
      ],
    );
  }

  // 🔹 HIỂN THỊ ẢNH THUẦN (đề xuất, mới phát hành, phổ biến)
  Widget _buildImageList(List<AudioBook> books) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () => onBookTap(book),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  book.coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 🔹 BÁN CHẠY — giao diện có thông tin
  Widget _buildBestSellerList(List<AudioBook> books) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () => onBookTap(book),
            child: Container(
              width: 200,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E48),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        book.coverUrl,
                        width: 70,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            book.author,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: List.generate(5, (i) {
                              return const Icon(Icons.star,
                                  color: Colors.orange, size: 16);
                            }),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '1,000+ lượt nghe',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
