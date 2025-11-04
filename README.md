# 🎧 AudioBook - Ứng dụng Sách nói Flutter

![Flutter 3.x](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart 3.x](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

**AudioBook** là một ứng dụng **nghe sách nói miễn phí**, đa nền tảng (Android, iOS, Web, Desktop) được phát triển bằng **Flutter** và **Hive**.  
Dự án được thực hiện trong khuôn khổ học phần **Lập trình cho Thiết bị Di động**, tập trung vào **thiết kế UI/UX hiện đại** và **quản lý dữ liệu cục bộ hiệu quả**.

---

## 📸 Giao diện & Tính năng Nổi bật

Ứng dụng mang đến trải nghiệm nghe sách nói hiện đại, trực quan và cá nhân hóa.

| Màn hình Trang chủ | Màn hình Thư viện | Màn hình Chi tiết sách | Màn hình Cài đặt |
| :---: | :---: | :---: | :---: |
| ![Home Screen](screenshots/home.png) | ![Library Screen](screenshots/library.png) | ![Detail Screen](screenshots/detail.png) | ![Settings Screen](screenshots/settings.png) |

---

## 🌟 Tính năng Chính

- 🎨 **Thư viện sách nói** với ảnh bìa, tên, tác giả  
- 🔍 **Tìm kiếm thông minh** theo tên hoặc tác giả  
- ▶️ **Trình phát audio** (phát/tạm dừng, tua nhanh/chậm)  
- ❤️ **Lưu hoặc xóa sách yêu thích** trong thư viện cá nhân (vuốt để xóa)  
- 🌐 **Đa ngôn ngữ**: Tiếng Việt & Tiếng Anh (`easy_localization`)  
- 🌀 **Hiệu ứng carousel 3D** trong trang chủ  
- 📖 **Xem chi tiết sách**: tóm tắt, bình luận, và thông tin tác giả  
- 💾 **Quản lý dữ liệu bằng Hive** (lưu offline)  
- 🧭 **Điều hướng thông minh** và giao diện trực quan, hiện đại  

---

## 🛠️ Kiến trúc & Công nghệ

Dự án được xây dựng với kiến trúc tách lớp rõ ràng (Models – Screens – Widgets – Database).

| Thành phần | Công nghệ sử dụng |
|-------------|------------------|
| **Ngôn ngữ lập trình** | Flutter 3.x / Dart 3.x |
| **Cơ sở dữ liệu** | Hive (Local NoSQL Database) |
| **Phát audio** | audioplayers |
| **Đa ngôn ngữ** | easy_localization |
| **Phông chữ & UI** | google_fonts, carousel_slider |
| **Quản lý dữ liệu** | Hive Adapter (`audiobook.g.dart`) |

---

## 📂 Cấu trúc Thư mục

```bash
lib/
├── models/          # Định nghĩa model AudioBook
├── screens/         # Các màn hình: home, search, library, detail, settings, player
├── widgets/         # Các widget tái sử dụng
├── database/        # Xử lý lưu trữ Hive
└── main.dart        # Điểm khởi đầu ứng dụng

assets/
├── images/          # Ảnh bìa sách
├── audios/          # File audio
└── langs/           # File ngôn ngữ en.json, vi.json
