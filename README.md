# AudioBook Flutter App

Ứng dụng nghe sách nói miễn phí, đa nền tảng (Android, iOS, Web, Desktop) sử dụng Flutter và Hive.

## Tính năng chính

- Hiển thị thư viện sách nói với ảnh bìa, tên, tác giả
- Tìm kiếm sách theo tên hoặc tác giả
- Nghe audio sách nói (hỗ trợ phát/tạm dừng, tua)
- Lưu/xóa sách vào thư viện cá nhân
- Đa ngôn ngữ: Tiếng Việt và Tiếng Anh (easy_localization)
- Carousel 3D cho trang chủ
- Xem chi tiết sách, bình luận, tóm tắt
- Quản lý dữ liệu bằng Hive (local database)
- Giao diện hiện đại, dễ sử dụng

## Cấu trúc thư mục

```
lib/
  models/         // Định nghĩa model AudioBook
  screens/        // Các màn hình: home, search, library, setting, detail, player,...
  widgets/        // Các widget dùng lại
assets/
  images/         // Ảnh bìa sách
  audios/         // File audio sách nói
  langs/          // File ngôn ngữ en.json, vi.json
```

## Cài đặt & chạy

1. **Clone dự án:**
   ```sh
   git clone <repo-url>
   cd audio_book
   ```

2. **Cài đặt dependencies:**
   ```sh
   flutter pub get
   ```

3. **Chạy app:**
   - Android/iOS:  
     ```sh
     flutter run
     ```
   - Web:  
     ```sh
     flutter run -d chrome
     ```

## Thêm dữ liệu mẫu

- Ảnh và audio cần khai báo trong `pubspec.yaml`:
  ```yaml
  flutter:
    assets:
      - assets/images/
      - assets/audios/
      - assets/langs/
  ```

## Đa ngôn ngữ

- Sử dụng [easy_localization](https://pub.dev/packages/easy_localization)
- Thay text cứng bằng key và `.tr()`, ví dụ:  
  ```dart
  Text('library_title'.tr())
  ```

## Đóng góp

- Fork và tạo pull request nếu bạn muốn đóng góp thêm tính năng hoặc sửa lỗi.

## License

MIT License. Xem chi tiết trong file [LICENSE](LICENSE).
