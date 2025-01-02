import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 156,
                  color: Color(0xFF8FD0E8),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    color: Color(0xFFFEF7FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/bear.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Playful English',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                  hintText: "Mật Khẩu",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,  // Căn phải
              child: Padding(
                padding: EdgeInsets.only(right: 20),  // Tạo khoảng cách 16px từ bên phải
                child: Text(
                  'Quên mật khẩu ?',
                  style: TextStyle(
                    fontSize: 14,  // Font size 14
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 40, // Đặt chiều cao của nút là 40px (nếu muốn nút vuông)
              width: 226,
              decoration: BoxDecoration(
                color: Color(0xFF8FD0E8),
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                'Đăng Nhập',
                style: TextStyle(
                  color: Colors.white,  // Màu chữ trắng
                  fontSize: 20,  // Font size 20
                ),
              ),
            ),
            SizedBox(height: 142),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,  // Màu chữ mặc định là đen
                  fontSize: 14,  // Kích thước font 14px cho tất cả văn bản
                ),
                children: [
                  TextSpan(
                    text: 'Chưa có tài khoản? ',  // Phần đầu của văn bản
                  ),
                  TextSpan(
                    text: 'Đăng ký',  // Phần "Đăng ký"
                    style: TextStyle(
                      color: Color(0xFFF82424),  // Màu chữ Đăng ký là #F82424
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}