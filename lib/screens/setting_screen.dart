import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  final String userName;
  final String avatarUrl;

  const SettingsScreen({
    super.key,
    this.userName = "Ryan Dang",
    this.avatarUrl = "assets/icons/icon_phenikaa.jpg",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E3C),
        title: const Text(
          'Cài đặt',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          // Avatar & Tên người dùng
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(avatarUrl),
                ),
                const SizedBox(height: 12),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Các tùy chọn trong danh sách
          _buildSettingTile(
            context,
            icon: Icons.person,
            title: 'Xem hồ sơ',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          _buildSettingTile(
            context,
            icon: Icons.notifications,
            title: 'Thông báo',
            trailing: Switch(
              value: true,
              activeColor: Colors.blueAccent,
              onChanged: (val) {},
            ),
          ),
          _buildSettingTile(
            context,
            icon: Icons.storage,
            title: 'Bộ nhớ',
            onTap: () {},
          ),
          _buildSettingTile(
            context,
            icon: Icons.info_outline,
            title: 'Giới thiệu về Audio Book',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Audio Book",
                applicationVersion: "1.0.0",
                children: [
                  const Text(
                    "Ứng dụng nghe sách nói miễn phí và tiện lợi.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              );
            },
          ),

          const Spacer(),

          // Nút đăng xuất
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Đăng xuất'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper tạo tile đẹp
  Widget _buildSettingTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      color: const Color(0xFF1E1E3C),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: trailing ??
            const Icon(Icons.chevron_right, color: Colors.white54),
        onTap: onTap,
      ),
    );
  }
}
