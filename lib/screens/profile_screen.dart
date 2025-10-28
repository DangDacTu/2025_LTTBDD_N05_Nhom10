import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String avatarUrl;
  final String displayName;
  final String username;
  final String email;
  final String phone;

  const ProfileScreen({
    super.key,
    this.avatarUrl = "assets/icons/icon_phenikaa.jpg",
    this.displayName = "Ryan Dang",
    this.username = "username123",
    this.email = "user@email.com",
    this.phone = "0123456789",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F29),
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(avatarUrl),
            ),
            const SizedBox(height: 16),
            Text(
              displayName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "@username123",
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 24),

            _buildInfoTile(Icons.person, "Tên đăng nhập", username),
            _buildInfoTile(Icons.email, "Email", email),
            _buildInfoTile(Icons.phone, "Số điện thoại", phone),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Chỉnh sửa hồ sơ",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C5CE0),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Chức năng chỉnh sửa đang được phát triển"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A40),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}
