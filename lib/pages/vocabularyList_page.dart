import 'package:flutter/material.dart';
import 'vocabulary_page.dart';

class VocabularyListScreen extends StatefulWidget {
  @override
  _VocabularyListScreenState createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends State<VocabularyListScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> vocabularyList = [
    {
      'word': 'Nice to meet you',
      'pronunciation': '/nais tuː miːt juː/',
      'meaning': 'Rất vui được gặp bạn',
      'image': 'assets/images/vocabulary-1.png'
    },
    {
      'word': 'Thank you',
      'pronunciation': '/θæŋk juː/',
      'meaning': 'Cảm ơn bạn',
      'image': 'assets/images/vocabulary-1.png'
    },
  ];

  void navigateNext() {
    setState(() {
      if (currentIndex < vocabularyList.length - 1) {
        currentIndex++;
      }
    });
  }

  void navigatePrevious() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = vocabularyList[currentIndex];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Container(
                height: 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFCD195),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(children: [
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
                ]),
              )
            ),
            SizedBox(height: 20),
            // Title
            Text(
              'Danh sách từ vựng',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFF7D6A6),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Image and Word
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFCD195)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      currentWord['image']!,
                      fit: BoxFit.contain,
                      height: 180,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Word
                  Text(
                    currentWord['word']!,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    currentWord['pronunciation']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    currentWord['meaning']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: navigatePrevious,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB2E4F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(120, 50),
                  ),
                  child: Text('Trước', style: TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: navigateNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB2E4F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(120, 50),
                  ),
                  child: Text('Sau', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    print("Phát âm");
                  },
                  icon: Icon(Icons.volume_up, color: Color(0xFF8ED7F1), size: 30),
                ),
                IconButton(
                  onPressed: () {
                    print("Chỉnh sửa");
                  },
                  icon: Icon(Icons.edit, color: Color(0xFF8ED7F1), size: 30),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VocabularyScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFCD195),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(200, 50),
              ),
              child: Text('Kiểm tra', style: TextStyle(fontSize: 16)),

            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}