import 'package:flutter/material.dart';

class ChallengeCompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70),
          Center(
            child: Text(
              'Congratulation',
              style: TextStyle(
                fontSize: 33,
                color: Color(0xFFF7D6A6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 21),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Chúc Mừng Bạn Đã Chinh Phục ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF8FD0E8),
                    ),
                  ),
                  TextSpan(
                    text: '\nThử Thách !',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF8FD0E8),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            width: 347,
            height: 509,
            decoration: BoxDecoration(
              color: Color(0xFFDDF8FA),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 42),
                      child: Image.asset(
                        'assets/images/celebration-1.png',
                        fit: BoxFit.contain,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(width: 25),
                    Image.asset(
                      'assets/images/celebration-2.png',
                      fit: BoxFit.contain,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 310,
                  height: 128,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDF2E2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 13),
                      Center(
                        child: Text(
                          'Thử thách từ vựng',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          'Time : 01:15',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 17),
                      Center(
                        child: Text(
                          'High Score: 15/25',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Image.asset(
                  'assets/images/horse-2.png',
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    print("Nút Hoàn thành đã được bấm!");
                  },
                  child: Container(
                    width: 310,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFB2E4F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Hoàn thành',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}