import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: EdgeInsets.only(top: 90),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/bear-2.png',
                  fit: BoxFit.contain,
                ),
              ),
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
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  hintText: "Tên Người Dùng",
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
                  hintText: 'Xác nhận Mật Khẩu',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
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
                'Đăng Ký',
                style: TextStyle(
                  color: Colors.white,  // Màu chữ trắng
                  fontSize: 20,  // Font size 20
                ),
              ),
            ),
            SizedBox(height: 70),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: 'Đã có tài khoản? ',
                  ),
                  TextSpan(
                    text: 'Đăng nhập',
                    style: TextStyle(
                      color: Color(0xFF14EAFE),
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