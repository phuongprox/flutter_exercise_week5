# 📝 Note App - Ứng Dụng Ghi Chú (Flutter/SQLite)

Ứng dụng tập trung vào việc triển khai lưu trữ cục bộ bằng **SQLite** và quản lý trạng thái bằng **Provider** trong Flutter.

<div align="center">
<img src="screenshot\main.png" width="100"/>
<img src="screenshot\create.png" width="100"/>
<img src="screenshot\editnote.png" width="100"/>
<img src="screenshot\note.png" width="100"/>
</div>

```
Video Demo: [**Xem video demo tại đây**](https://drive.google.com/file/d/1WxUDdATsrUI2H1AnEZD5Yf91IB2ZB-gT/view?usp=sharing)
```

## ✨ Tính năng chính

Dự án triển khai đầy đủ các chức năng **CRUD** (Create, Read, Update, Delete) cho ghi chú:

* **Tạo ghi chú:** Cho phép tạo ghi chú mới với tiêu đề và nội dung.
* **Xem danh sách:** Hiển thị tất cả ghi chú, sắp xếp theo thời gian cập nhật gần nhất.
* **Chỉnh sửa ghi chú:** Sửa đổi ghi chú hiện có.
* **Xóa ghi chú:** Thực hiện xóa với hộp thoại **xác nhận**.
* **Lưu trữ:** Dữ liệu được lưu cục bộ và không bị mất khi đóng ứng dụng.
* **Theo dõi thời gian (Timestamps):** Ghi lại thời gian tạo và cập nhật.

## 🛠️ Công nghệ Sử dụng (Tech Stack)

| Package | Phiên bản | Mục đích |
| :--- | :--- | :--- |
| **`flutter`** | N/A | Nền tảng phát triển ứng dụng di động. |
| **`sqflite`** | ^2.3.0 | Giao diện cho **SQLite**, được sử dụng làm cơ sở dữ liệu cục bộ. |
| **`provider`** | ^6.1.0 | Giải pháp quản lý trạng thái, giúp chia sẻ dữ liệu và cập nhật giao diện (UI). |
| **`path_provider`** | ^2.1.0 | Được sử dụng để tìm đường dẫn lưu file database trên thiết bị. |
| **`intl`** | ^0.18.0 | Hỗ trợ định dạng ngày giờ. |

## 🏗️ Cấu trúc dự án

Dự án tuân theo cấu trúc phân tầng (Layered Architecture) tiêu chuẩn của Flutter:
```markdown
lib/
├── database/            # Quản lý database và các thao tác CRUD
│   └── db_helper.dart
├── models/              # Định nghĩa cấu trúc dữ liệu
│   └── note.dart
├── providers/           # Logic quản lý trạng thái
│   └── note_provider.dart
├── screens/             # Các màn hình chính của ứng dụng (UI)
│   ├── home_page.dart
│   └── note_editor_screen.dart
├── widgets/             # Các thành phần UI có thể tái sử dụng
├── main.dart            # Điểm khởi đầu và thiết lập Provider
```
## 🚀 Các bước Cài đặt và Chạy

1.  **Clone Repository:**
    ```bash
    git clone https://github.com/phuongprox/flutter_exercise_week5
    cd flutter_exercise_week5
    ```

2.  **Cài đặt Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Khởi động Ứng dụng:**
    ```bash
    flutter run
    ```

## 💡 Chi tiết Triển khai Kỹ thuật

* **Database Helper:** Triển khai **Mẫu Singleton** để đảm bảo chỉ có một instance database duy nhất.
* **Note Model:** Sử dụng **Timestamp Integer** (`millisecondsSinceEpoch`) để lưu trữ `DateTime` vào SQLite.
* **State Management:** Sử dụng `ChangeNotifierProvider` để bọc ứng dụng và gọi `notifyListeners()` trong `NoteProvider` sau mỗi thao tác CRUD để cập nhật UI.

---
**Tác giả:** [Nguyễn Nam Phương - 2224801030038 -Thu Dau Mot University ]
