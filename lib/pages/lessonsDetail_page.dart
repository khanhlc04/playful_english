import 'package:flutter/material.dart';
import 'vocabularyList_page.dart';
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

  Widget buildVocabularyItem(String index, double padding, String title) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng lesson từ widget
    Lesson lesson = widget.lesson;

    return Scaffold(
      body: Stack(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lesson.title,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'High Score: ${lesson.highScore}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                            ),
                            SizedBox(height: 13),
                            Container(
                              height: 15,
                              width: 210,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  FractionallySizedBox(
                                    widthFactor: double.parse(
                                            lesson.progress.split('/')[0]) /
                                        double.parse(
                                            lesson.progress.split('/')[1]),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF8ED7F1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, -3.5),
                                    child: Center(
                                      child: Text(
                                        lesson.progress,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    buildVocabularyItem("1", 230, "Từ Vựng"),
                    SizedBox(height: 55),
                    buildVocabularyItem("2", 100, "Ngữ Pháp"),
                    SizedBox(height: 60),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Row(
                      children: [
                        buildVocabularyItem("3", 80, "Truyện"),
                        Image.asset(
                          'assets/images/horse-1.png',
                          fit: BoxFit.contain,
                          height: 150,
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 60),
                    buildVocabularyItem("?", 30, "Thử Thách Cuối Cùng"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}