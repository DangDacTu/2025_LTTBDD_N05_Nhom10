import 'package:flutter/material.dart';
import 'onbroarding_screen.dart'; // Đảm bảo import đúng tên file

class StudentInfoScreen extends StatelessWidget {
  final String name;
  final String studentId;
  final String email;

  const StudentInfoScreen({
    super.key,
    this.name = "Đặng Đắc Tú",
    this.studentId = "23010619",
    this.email = "23010619@st.phenikaa-uni.edu.vn",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin sinh viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              "Họ và tên:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(name, style: TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            Text(
              "Mã số sinh viên:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(studentId, style: TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            Text(
              "Email:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(email, style: TextStyle(fontSize: 18)),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                  );
                },
                child: const Text('Tiếp theo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
