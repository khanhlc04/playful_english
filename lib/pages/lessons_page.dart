import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String highScore;
  final String progress;
  final Color color;
  final String image;

  Lesson({
    required this.title,
    required this.highScore,
    required this.progress,
    required this.color,
    required this.image
  });
}

class LessonsScreen extends StatelessWidget {
  final List<Lesson> lessons = [
    Lesson(title: 'Lesson 1: Say Hello', highScore: '90/100', progress: '3/4', color: Color(0xFFFCD195), image: 'assets/images/bear-4.png'),
    Lesson(title: 'Lesson 2: Numbers', highScore: '30/100', progress: '1/4', color: Color(0xFFFDCFD2), image :'assets/images/bear-5.png' ),
    Lesson(title: 'Lesson 3: Animals', highScore: '0/100', progress: '0/4', color: Color(0xFF6FE9CB), image: 'assets/images/bear-6.png'),
    Lesson(title: 'Lesson 4: Activities', highScore: '0/100', progress: '0/4', color: Color(0xFFAAE3F7), image: 'assets/images/bear-7.png'),
    Lesson(title: 'Lesson 1: Say Hello', highScore: '90/100', progress: '3/4', color: Color(0xFFFCD195), image: 'assets/images/bear-4.png'),
    Lesson(title: 'Lesson 2: Numbers', highScore: '30/100', progress: '1/4', color: Color(0xFFFDCFD2), image :'assets/images/bear-5.png' ),
    Lesson(title: 'Lesson 3: Animals', highScore: '0/100', progress: '0/4', color: Color(0xFF6FE9CB), image: 'assets/images/bear-6.png'),
    Lesson(title: 'Lesson 4: Activities', highScore: '0/100', progress: '0/4', color: Color(0xFFAAE3F7), image: 'assets/images/bear-7.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            color: Color(0xFF8FD0E8),
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
                        'Xin chào, Tom',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Cùng chinh phục hành trình nào!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/bear-3.png',
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
                  children: lessons.map((lesson) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: lesson.color,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    height: 17,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Stack(
                                      children: [
                                        FractionallySizedBox(
                                          widthFactor: double.parse(lesson.progress.split('/')[0]) /
                                              double.parse(lesson.progress.split('/')[1]),
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
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                              child: Image.asset(
                                lesson.image,
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}