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
    required this.image,
  });
}

class LessonsScreen extends StatefulWidget {
  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  List<Lesson> lessons = [
    Lesson(title: 'Lesson 1: Say Hello', highScore: '90/100', progress: '3/4', color: Color(0xFFFCD195), image: 'assets/images/bear-4.png'),
    Lesson(title: 'Lesson 2: Numbers', highScore: '30/100', progress: '1/4', color: Color(0xFFFDCFD2), image: 'assets/images/bear-5.png'),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonDetailScreen(lesson: lesson),
                            ),
                          );
                        },
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
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Lesson",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volume_up),
            label: "Pronounce",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Ranking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lesson.color,
        title: Text(lesson.title),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildStep(context, "Từ vựng", Colors.blue, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VocabularyListScreen(),
                    ),
                  );
                }),
                _buildStep(context, "Ngữ pháp", Colors.green, () {}),
                _buildStep(context, "Truyện", Colors.orange, () {}),
                _buildStep(context, "Thử thách cuối cùng!", Colors.red, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(BuildContext context, String title, Color color, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: color.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Text(
                  title[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




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
    // Thêm từ vựng khác tại đây
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
        leading: Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Progress bar
            LinearProgressIndicator(
              value: (currentIndex + 1) / vocabularyList.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8ED7F1)),
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
                  // Pronunciation
                  Text(
                    currentWord['pronunciation']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Meaning
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
            // Navigation Buttons
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
            // Additional Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    // Thêm logic phát âm
                    print("Phát âm");
                  },
                  icon: Icon(Icons.volume_up, color: Color(0xFF8ED7F1), size: 30),
                ),
                IconButton(
                  onPressed: () {
                    // Thêm logic chỉnh sửa
                    print("Chỉnh sửa");
                  },
                  icon: Icon(Icons.edit, color: Color(0xFF8ED7F1), size: 30),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Logic chuyển đến màn hình kiểm tra
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






class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // Giảm khoảng cách ngang
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02), // Thêm khoảng cách động
              Container(
                height: screenHeight * 0.03,
                width: double.infinity,
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
                          fontSize: screenHeight * 0.02, // Tỷ lệ font chữ
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: Text(
                  'Chọn từ đúng',
                  style: TextStyle(
                    fontSize: screenHeight * 0.04,
                    color: Color(0xFFF7D6A6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Image.asset(
                'assets/images/vocabulary-1.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.3,
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'Xin Chào',
                  style: TextStyle(
                    fontSize: screenHeight * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: () => print('Hello'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB2E4F6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.08),
                  elevation: 2,
                ),
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () => print('Goodbye'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB2E4F6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.08),
                  elevation: 2,
                ),
                child: Text(
                  'Goodbye',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
