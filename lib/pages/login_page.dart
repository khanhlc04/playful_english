import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:playful_english/pages/register_page.dart';
import 'lessons_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email != "khanhlc04@gmail.com") {
      _showDialog(
        "Tài khoản không tồn tại",
        "Vui lòng đăng ký hoặc đăng nhập bằng Gmail khác.",
      );
    } else if (password != "Khanh22122004") {
      _showDialog(
        "Sai mật khẩu",
        "Vui lòng nhập lại mật khẩu chính xác.",
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LessonsScreen()),
      );
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20), // Đảm bảo có khoảng cách trên dưới
          child: Column(
            mainAxisSize: MainAxisSize.min, // Để tránh bị lỗi tràn
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
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 70),
              _buildInputField(_emailController, Icons.email, "Email", false),
              SizedBox(height: 15),
              _buildInputField(_passwordController, Icons.lock, "Mật Khẩu", true),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Quên mật khẩu ?',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _login,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(text: 'Chưa có tài khoản? '),
                    TextSpan(
                      text: 'Đăng ký',
                      style: TextStyle(color: Color(0xFFF82424)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Thêm khoảng cách để tránh tràn màn hình
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildInputField(TextEditingController controller, IconData icon, String hint, bool isPassword) {
  return Container(
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
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

