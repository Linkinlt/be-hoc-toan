# Bé Học Toán

Game toán cộng trừ trong phạm vi 10 cho bé 5 tuổi, chơi trên Android TV / máy chiếu bằng remote.

## Cách chơi
- Màn đầu có bé gái nhờ: *"Chị ơi, em muốn mua đồ! Chị làm bài để kiếm tiền cho em mua nhé!"*
- **Chơi nào!** → chọn mức:
  - **Dễ**: phép tính 2 số, 2 câu đúng = 1 ⭐
  - **Vừa**: phép tính 3 số, 1 câu đúng = 1 ⭐
  - **Khó**: phép tính 4 số, 1 câu đúng = 2 ⭐
  - Trả lời sai hoặc hết giờ: mất 1 ⭐ (không xuống dưới 0)
- Mỗi bài 10 câu, mỗi câu 10 giây (tính sau khi đọc xong câu hỏi). Câu hỏi ngẫu nhiên, không trùng trong một bài, kết quả luôn từ 0 đến 10.
- App đọc câu hỏi; đúng thì "Bùm không cùi!", sai thì "Bùm cùi thế, cùi thế!", rồi đọc lại phép tính và kết quả.
- **Cửa hàng**: Tóc, Áo, Quần, Váy, Giày, Phụ kiện. Mỗi loại có mức **Vừa (1 ⭐)**, **Đẹp (2 ⭐)**, **Sang trọng (3 ⭐)**. Đồ đã mua bấm OK để mặc / cởi. Sao và đồ được lưu lại.

## Remote
- ◀ ▶ ▲ ▼: di chuyển, **OK**: chọn, **Back**: quay lại (đang chơi thì tạm dừng, ở màn chính thì thoát).
- Phím số 0–9 trên remote cũng trả lời được.

## Thư mục
- `web/be-hoc-toan.html` — mã game (sửa game ở đây).
- `android/` — vỏ app Android (WebView + đọc giọng Google TTS), dạng apktool.
- `apk/BeHocToan.apk` — bản APK mới nhất để cài luôn.
- `build.bat` / `build.sh` — đóng gói lại APK, kết quả ở `output/BeHocToan.apk`.

## Đóng gói lại trên Windows
Cần cài Java và Python. Mở **Command Prompt**:
```
cd C:\duong-dan\be-hoc-toan
build.bat
```
APK nằm ở `output\BeHocToan.apk`. Trước khi build, nhớ tăng `versionCode` trong `android/apktool.yml`.
APK luôn ký cùng một khoá nên cài đè lên bản cũ được, không cần gỡ.
