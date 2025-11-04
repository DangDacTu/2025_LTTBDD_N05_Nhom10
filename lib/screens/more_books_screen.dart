import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/audiobook.dart';

class MoreBooksScreen extends StatelessWidget {
  final List<AudioBook> books;
  final void Function(AudioBook) onBookTap;

  const MoreBooksScreen({
    super.key,
    required this.books,
    required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F29),
        elevation: 0,
        title: Text(
          'see_more'.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: books.isEmpty
          ? const Center(
              child: Text(
                'No books available',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: books.length,
              separatorBuilder: (_, __) =>
                  const Divider(color: Colors.white12, height: 24),
              itemBuilder: (context, index) {
                final book = books[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => onBookTap(book),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          book.coverUrl,
                          width: 60,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 60,
                            height: 80,
                            color: Colors.grey.shade800,
                            child: const Icon(Icons.broken_image,
                                color: Colors.white54),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
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
                      const Icon(Icons.chevron_right, color: Colors.white),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
