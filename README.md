# 🎧 AudioBook - Ứng dụng Sách nói

![Flutter 3.x](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart 3.x](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

**AudioBook** là một ứng dụng **nghe sách nói miễn phí**, đa nền tảng (Android, iOS, Web, Desktop) được phát triển bằng **Flutter** và **Hive**.  
Dự án được thực hiện trong khuôn khổ học phần **Lập trình cho Thiết bị Di động**, tập trung vào **thiết kế UI/UX hiện đại**.

---
### Link demo : 
---
<h2>📸 Giao diện & Tính năng Nổi bật</h2>

<p>Ứng dụng mang đến trải nghiệm <b>nghe sách nói hiện đại, trực quan và cá nhân hóa</b>, với nhiều màn hình được thiết kế tối giản và dễ sử dụng.</p>

<table>
  <tr>
    <td align="center"><img src="assets/images/splash.png" alt="Splash Screen" height="300"><br><b>Splash</b></td>
    <td align="center"><img src="assets/images/login.png" alt="Login Screen" height="300"><br><b>Đăng nhập</b></td>
    <td align="center"><img src="assets/images/welcome.png" alt="Welcome Screen" height="300"><br><b>Chào mừng</b></td>
    <td align="center"><img src="assets/images/home.png" alt="Home Screen" height="300"><br><b>Trang chủ</b></td>
    <td align="center"><img src="assets/images/library.png" alt="Library Screen" height="300"><br><b>Thư viện</b></td>
  </tr>
  <tr>
    <td align="center"><img src="assets/images/detail_book.png" alt="Detail Screen" height="300"><br><b>Chi tiết sách</b></td>
    <td align="center"><img src="assets/images/sreach.png" alt="Search Screen" height="300"><br><b>Tìm kiếm</b></td>
    <td align="center"><img src="assets/images/play.png" alt="Play Screen" height="300"><br><b>Phát</b></td>
    <td align="center"><img src="assets/images/setting.png" alt="Settings Screen" height="300"><br><b>Cài đặt</b></td>
    <td align="center"><img src="assets/images/profile.png" alt="Profile Screen" height="300"><br><b>Hồ sơ cá nhân</b></td>
  </tr>
</table>


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
## 🚀 Hướng dẫn cài đặt & chạy ứng dụng

### 1. Clone dự án về máy
```sh
git clone https://github.com/DangDacTu/2025_LTTBDD_N05_Nhom10.git
cd audio_book
```

### 2. Cài đặt các thư viện phụ thuộc
```sh
flutter pub get
```

### 3. Chạy ứng dụng
- **Android/iOS:**
  ```sh
  flutter run
  ```
- **Web:**
  ```sh
  flutter run -d chrome
  ```
- **Windows/macOS/Linux:**
  ```sh
  flutter run -d windows
  flutter run -d macos
  flutter run -d linux
  ```
---

## 📂 Cấu trúc Thư mục

```bash
audio_book/
├── assets/         # Chứa các tài nguyên tĩnh như audio, ảnh, icon, file ngôn ngữ
│   ├── audios/     # File audio sách nói
│   ├── images/     # Ảnh bìa sách, hình minh họa
│   ├── icons/      # Icon ứng dụng, hình minh họa nhỏ
│   └── langs/      # File ngôn ngữ (vi.json, en.json) dùng cho đa ngôn ngữ
│
├── lib/            # Chứa toàn bộ mã nguồn chính của ứng dụng Flutter
│   ├── models/     # Định nghĩa các đối tượng dữ liệu (ví dụ: AudioBook)
│   ├── screens/    # Các màn hình giao diện chính của ứng dụng
│   ├── widgets/    # Các widget tái sử dụng (ví dụ: BookCard)
│   ├── utils/      # Các tiện ích dùng chung (màu sắc, theme, ...)
│   └── main.dart   # Điểm khởi đầu ứng dụng, cấu hình MaterialApp và EasyLocalization
│
├── pubspec.yaml    # Khai báo thư viện, tài nguyên và cấu hình dự án Flutter
└── README.md       # Giới thiệu, hướng dẫn sử dụng và thông tin dự án
```
---
## Thông Tin Nhóm
| Thành viên | Mã số sinh viên | Email |
|-------------|------------------|------|
| Đặng Đắc Tú | 23010619 | 23010619@st.phenikaa-uni.edu.vn|

* **GitHub:** [github.com/Audio_Book_App](https://github.com/DangDacTu/2025_LTTBDD_N05_Nhom10)
---


