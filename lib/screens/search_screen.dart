import 'package:flutter/material.dart';
import '../models/audiobook.dart';
import 'setting_screen.dart';

class SearchScreen extends StatefulWidget {
  final void Function(AudioBook) onBookTap;
  const SearchScreen({super.key, required this.onBookTap});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  List<String> searchHistory = [];

  final List<Map<String, String>> recommendedCategories = [
    {'title': 'Kinh doanh', 'icon': '💼'},
    {'title': 'Cá nhân', 'icon': '👤'},
    {'title': 'Âm nhạc', 'icon': '🎵'},
    {'title': 'Nhiếp ảnh', 'icon': '📷'},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredBooks = demoBooks
        .where((book) =>
            book.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            book.author.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F29),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tìm kiếm sách nói',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thanh tìm kiếm
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sách hoặc tác giả...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: const Color(0xFF1B1B3A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              onSubmitted: (value) {
                if (value.trim().isNotEmpty &&
                    !searchHistory.contains(value.trim())) {
                  setState(() {
                    searchHistory.insert(0, value.trim());
                    if (searchHistory.length > 10) {
                      searchHistory = searchHistory.sublist(0, 10);
                    }
                  });
                }
              },
            ),
            const SizedBox(height: 24),

            // Các thể loại gợi ý
            const Text(
              'Thể loại nổi bật',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final cat = recommendedCategories[index];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B263B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(cat['icon']!,
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 6),
                        Text(
                          cat['title']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Lịch sử tìm kiếm
            if (searchHistory.isNotEmpty) ...[
              const Text(
                'Lịch sử tìm kiếm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: searchHistory.map((keyword) {
                  return ActionChip(
                    backgroundColor: const Color(0xFF2C2C54),
                    label: Text(keyword,
                        style: const TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        searchQuery = keyword;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],

            // Kết quả tìm kiếm
            const Text(
              'Kết quả tìm kiếm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: searchQuery.isEmpty
                  ? const Center(
                      child: Text(
                        'Nhập từ khóa để bắt đầu tìm kiếm',
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                    )
                  : (filteredBooks.isEmpty
                      ? const Center(
                          child: Text(
                            'Không tìm thấy sách nào',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 16),
                          ),
                        )
                      : ListView.separated(
                          itemCount: filteredBooks.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final book = filteredBooks[index];
                            return GestureDetector(
                              onTap: () => widget.onBookTap(book),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      book.coverUrl,
                                      width: 70,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          book.author,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
