import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  final String userName;
  final String avatarUrl;

  const SettingsScreen({
    super.key,
    this.userName = "Ryan Dang",
    this.avatarUrl = "assets/icons/icon_phenikaa.jpg",
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Locale? _selectedLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLocale ??= context.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E3C),
        title: const Text('settings', style: TextStyle(color: Colors.white)).tr(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(widget.avatarUrl),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.userName,
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

          _buildSettingTile(
            context,
            icon: Icons.person,
            title: 'profile'.tr(),
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
            title: 'notifications'.tr(),
            trailing: Switch(
              value: true,
              activeColor: Colors.blueAccent,
              onChanged: (val) {},
            ),
          ),

          _buildSettingTile(
            context,
            icon: Icons.storage,
            title: 'storage'.tr(),
            onTap: () {},
          ),

          _buildSettingTile(
            context,
            icon: Icons.info_outline,
            title: 'about_app'.tr(),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Audio Book",
                applicationVersion: "1.0.0",
                children: [
                  Text(
                    tr("about_description"),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              );
            },
          ),

          // Chuyển ngôn ngữ (đẹp + không viền)
      // Chuyển ngôn ngữ (màu nền đồng bộ 0xFF1E1E3C, không gradient)
            _buildSettingTile(
              context,
              icon: Icons.language,
              title: 'language'.tr(),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E3C), 
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    dropdownColor: const Color(0xFF1E1E3C), 
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    value: _selectedLocale,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    items: const [
                      DropdownMenuItem(
                        value: Locale('vi'),
                        child: Text('🇻🇳 Tiếng Việt'),
                      ),
                      DropdownMenuItem(
                        value: Locale('en'),
                        child: Text('🇬🇧 English'),
                      ),
                    ],
                    onChanged: (locale) async {
                      if (locale != null) {
                        setState(() {
                          _selectedLocale = locale;
                        });
                        await context.setLocale(locale);
                      }
                    },
                  ),
                ),
              ),
            ),


          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: Text('logout'.tr()),
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
