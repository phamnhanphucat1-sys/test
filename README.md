# Little Blossom — Website lời chúc 20/10

Website tĩnh + Cloudflare Pages Functions, D1 và R2.

## Cấu trúc
- `index.html`: trang nhập mã và thư cá nhân
- `admin.html`: bảng quản trị
- `assets/`: CSS và JavaScript trình duyệt
- `functions/api/`: API phía máy chủ
- `schema.sql`: cấu trúc D1
- `wrangler.jsonc`: binding Cloudflare

## Trước khi triển khai
1. Tạo D1 database tên `little-blossom-db`.
2. Chạy `schema.sql` trong D1 Console.
3. Tạo R2 bucket tên `little-blossom-photos`.
4. Thay `REPLACE_WITH_D1_DATABASE_ID` trong `wrangler.jsonc` bằng database ID thật.
5. Trong Cloudflare Pages > Settings > Variables and Secrets, thêm secrets:
   - `ADMIN_PASSWORD`: mật khẩu quản trị mạnh, dài ít nhất 16 ký tự.
   - `SESSION_SECRET`: chuỗi ngẫu nhiên bí mật dài ít nhất 32 ký tự.
6. Bindings:
   - D1 database: variable name `DB`
   - R2 bucket: variable name `PHOTOS`
7. Kết nối repository GitHub với Cloudflare Pages, framework preset `None`, build command để trống, output directory `.`.
8. Mỗi lần thay binding/config, deploy lại.

## Lưu ý bảo mật
- Không commit mật khẩu, mã thật hoặc `.dev.vars`.
- Mã người nhận được lưu dưới dạng SHA-256 hash; nên dùng mã ngẫu nhiên dài, không phải ngày sinh hoặc số thứ tự.
- Tài khoản admin dùng cookie HttpOnly/SameSite và session phía server; API quản trị có CSRF token.
- Hãy kiểm tra `Set-Cookie` sau deploy và chỉ dùng website qua HTTPS.
- Đây là bộ khung ban đầu cần kiểm thử trên Cloudflare trước khi dùng với dữ liệu thật. Nên bổ sung giới hạn thử mã (rate limiting) trước khi công khai.
- Không có người nhận thật được tạo sẵn. Hãy nhập từng người qua trang quản trị sau khi cấu hình xong.
