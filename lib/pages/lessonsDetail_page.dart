import 'package:flutter/material.dart';
import 'package:playful_english/pages/game.dart';
import 'package:playful_english/pages/story_page.dart';
import 'package:playful_english/pages/study_page.dart';
import 'package:playful_english/models/lesson.dart';
import 'package:playful_english/widgets/bottomNavigationBar.dart';

class LessonDetailScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonDetailScreen({Key? key, required this.lesson}) : super(key: key);

  @override
  _LessonDetailScreenState createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Hàm xử lý khi nhấn vào từng mục
  void _navigateToStudyScreen(String type, Color mainColor, Lesson lesson) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StudyScreen(type: type, mainColor: mainColor, lesson: lesson),
      ),
    );
  }

  Widget buildVocabularyItem(
      String index, double padding, String title, String type) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: GestureDetector(
        onTap: () {
          if (type == "story") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StoryScreen(lesson: widget.lesson)),
            );
          }
          else if(type == "game") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemoryGameApp()),
            );
          }
          else {
            _navigateToStudyScreen(type, widget.lesson.color, widget.lesson);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 76,
                  height: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.lesson.color,
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      index,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Lesson lesson = widget.lesson;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: lesson.color,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              color: lesson.color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'High Score: ${lesson.highScore}',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      lesson.image,
                      fit: BoxFit.contain,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    buildVocabularyItem("1", 230, "Từ Vựng", "vocabulary"),
                    SizedBox(height: 55),
                    buildVocabularyItem("2", 100, "Ngữ Pháp", "grammar"),
                    SizedBox(height: 60),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Row(
                        children: [
                          buildVocabularyItem("3", 80, "Truyện", "story"),
                          Image.asset(
                            'assets/images/horse-1.png',
                            fit: BoxFit.contain,
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    buildVocabularyItem("?", 30, "Thử Thách Cuối Cùng", "game"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
