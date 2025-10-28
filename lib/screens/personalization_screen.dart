import 'package:flutter/material.dart';
import 'loading_screen.dart';

class PersonalizationScreen extends StatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  State<PersonalizationScreen> createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> {
  final List<String> genres = [
    'Nghệ thuật',
    'Kinh doanh',
    'Tiểu sử',
    'Hài',
    'Văn hóa',
    'Giáo dục',
    'Triết lý',
    'Tâm lý',
    'Công nghệ',
    'Du lịch',
  ];

  final Set<String> selectedGenres = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F29),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cá nhân hóa thể loại',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chọn các thể loại bạn yêu thích để chúng tôi gợi ý phù hợp hơn:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),

              // 📚 Danh sách thể loại
              Expanded(
                child: ListView(
                  children: genres.map((genre) {
                    final selected = selectedGenres.contains(genre);
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF1F1F3C)
                            : const Color(0xFF151530),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected
                              ? const Color(0xFF6C63FF)
                              : Colors.white24,
                          width: 1,
                        ),
                      ),
                      child: CheckboxListTile(
                        activeColor: const Color(0xFF6C63FF),
                        checkColor: Colors.white,
                        title: Text(
                          genre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        value: selected,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              selectedGenres.add(genre);
                            } else {
                              selectedGenres.remove(genre);
                            }
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // 🔘 Nút tiếp tục
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: selectedGenres.isNotEmpty
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoadingScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    disabledBackgroundColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Tiếp tục',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
