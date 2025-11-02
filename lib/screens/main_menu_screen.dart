import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // ✅ Thêm dòng này
import 'home_screen.dart';
import 'search_screen.dart';
import '../models/audiobook.dart';
import 'library_screen.dart';
import 'book_detail_screen.dart';
import 'book_in_library_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _selectedIndex = 0;
  AudioBook? _selectedBook;
  bool _showBookInLibrary = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedBook = null;
      _showBookInLibrary = false;
    });
  }

  void _openBookDetail(AudioBook book) {
    setState(() {
      _selectedBook = book;
      _showBookInLibrary = false;
    });
  }

  void _openBookInLibrary(AudioBook book) {
    setState(() {
      _selectedBook = book;
      _showBookInLibrary = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(onBookTap: _openBookDetail),
      SearchScreen(onBookTap: _openBookDetail),
      LibraryScreen(onBookTap: _openBookInLibrary),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      body: _selectedBook != null
          ? (_showBookInLibrary
              ? BookInLibraryScreen(
                  book: _selectedBook!,
                  onBack: () => setState(() => _selectedBook = null),
                )
              : BookDetailScreen(
                  book: _selectedBook!,
                  onBack: () => setState(() => _selectedBook = null),
                ))
          : _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A3F),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF1A1A3F),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'home'.tr(), // ✅ dùng key JSON
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: 'search'.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.library_books),
                label: 'library'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
