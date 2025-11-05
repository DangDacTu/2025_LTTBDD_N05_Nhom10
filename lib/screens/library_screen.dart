import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/audiobook.dart';
import 'setting_screen.dart';

class LibraryScreen extends StatefulWidget {
  final void Function(AudioBook) onBookTap;
  const LibraryScreen({super.key, required this.onBookTap});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<AudioBook>('books').listenable(),
      builder: (context, Box<AudioBook> box, _) {
        final books = box.values
            .where((book) =>
                book.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
                book.author.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();

        return Scaffold(
          backgroundColor: const Color(0xFF0F0F29),
          appBar: AppBar(
            backgroundColor: const Color(0xFF0F0F29),
            title: Text(
              'library_title'
                  .tr(), //  khóa ngôn ngữ: tiêu đề "Thư viện của tôi"
              style: const TextStyle(
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
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Ô tìm kiếm
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'search_library_hint'.tr(), // hint ngôn ngữ
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xFF1E1E3C),
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
                ),
                const SizedBox(height: 20),

                // Danh sách sách
                Expanded(
                  child: books.isEmpty
                      ? Center(
                          child: Text(
                            'empty_library_message'
                                .tr(), // thông báo ngôn ngữ
                            style: const TextStyle(color: Colors.white70),
                          ),
                        )
                      : ListView.separated(
                          itemCount: books.length,
                          separatorBuilder: (_, __) => const Divider(
                            color: Colors.white12,
                            height: 20,
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            final book = books[index];

                            return Dismissible(
                              key: Key(book.key
                                  .toString()), // Dùng key duy nhất cho mỗi sách
                              direction: DismissDirection
                                  .endToStart, // Trượt từ phải sang trái
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.redAccent,
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              onDismissed: (_) async {
                                await book.delete();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${book.title} ${'deleted_from_library'.tr()}',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    book.coverUrl,
                                    width: 50,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  book.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  book.author,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                trailing: const Icon(Icons.chevron_right,
                                    color: Colors.white),
                                onTap: () => widget.onBookTap(book),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
