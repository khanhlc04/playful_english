import 'package:flutter/material.dart';

class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFFCD195),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF8ED7F1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '2/5',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                  ),
                ]
              ),
            )
          ),
          SizedBox(height: 30,),
          Center(
            child: Text(
              'Chọn từ đúng',
              style: TextStyle(
                fontSize: 33,
                color: Color(0xFFF7D6A6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 40,),
          Image.asset(
            'assets/images/vocabulary-1.png',
            fit: BoxFit.contain,
            height: 263,
          ),
          SizedBox(height: 15,),
          Center(
            child: Text(
              'Xin Chào',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 80,),
          ElevatedButton(
            onPressed:  () => print('123'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB2E4F6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: Size(340, 72),
            elevation: 2,
            ),
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 28,),
          ElevatedButton(
            onPressed:  () => print('123'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB2E4F6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(340, 72),
              elevation: 2,
            ),
            child: Text(
              'Goodbye',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
