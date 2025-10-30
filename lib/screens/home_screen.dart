import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
        title: Text(
          'app_title'.tr(), // ✅ đổi từ home_title -> app_title
          style: const TextStyle(
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
            Text(
              'category'.tr(), // ✅ đổi từ categories -> category
              style: const TextStyle(
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
                  _buildCategory('art'.tr()),
                  _buildCategory('business'.tr()),
                  _buildCategory('biography'.tr()),
                  _buildCategory('comedy'.tr()),
                  _buildCategory('education'.tr()),
                  _buildCategory('psychology'.tr()),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 ĐỀ XUẤT CHO BẠN
            _buildSectionTitle('recommended_for_you'.tr()), // ✅ đổi từ recommended -> recommended_for_you
            const SizedBox(height: 8),
            _buildImageList(books),

            const SizedBox(height: 24),

            // 🔹 BÁN CHẠY
            _buildSectionTitle('best_sellers'.tr()),
            const SizedBox(height: 8),
            _buildBestSellerList(books),

            const SizedBox(height: 24),

            // 🔹 MỚI PHÁT HÀNH
            _buildSectionTitle('new_releases'.tr()),
            const SizedBox(height: 8),
            _buildImageList(books),

            const SizedBox(height: 24),

            // 🔹 PHỔ BIẾN HIỆN NAY
            _buildSectionTitle('trending_now'.tr()), // ✅ đổi từ trending -> trending_now
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
        Text(
          'see_more'.tr(),
          style: const TextStyle(color: Colors.blueAccent),
        ),
      ],
    );
  }

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
                          Text(
                            'listen_count'.tr(),
                            style: const TextStyle(
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
