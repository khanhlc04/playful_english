import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:playful_english/models/lesson.dart';
import 'package:playful_english/pages/challengeComplete_page.dart';

class QuizQuestion {
  final String image;
  final String word; // từ gốc hiển thị (ví dụ: "Xin Chào")
  final String option1;
  final String option2;
  final String option3;
  final int correctOption; // 1 hoặc 2

  QuizQuestion({
    required this.image,
    required this.word,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.correctOption,
  });
}

class ExerciseScreen extends StatefulWidget {
  final String type; // Đảm bảo khai báo đúng kiểu dữ liệu và biến này là final
  final Color mainColor;
  final Lesson lesson;

  // Constructor
  ExerciseScreen(
      {required this.type, required this.mainColor, required this.lesson});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late List<QuizQuestion> questions; // danh sách 10 câu được chọn ngẫu nhiên
  int currentQuestionIndex = 0;
  int correctCount = 0;
  int? selectedOption; // 1 hoặc 2
  bool answerSubmitted = false;

  // Tạo danh sách 20 câu hỏi mẫu
  final List<QuizQuestion> vocabularyQuestions = [
    QuizQuestion(
      image: 'assets/images/turtle.jpg',
      word: 'Rùa',
      option1: 'Turtle',
      option2: 'Rabbit',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/rabbit.jpg',
      word: 'Thỏ',
      option1: 'Turtle',
      option2: 'Rabbit',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/dog.jpg',
      word: 'Chó',
      option1: 'Dog',
      option2: 'Cat',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/cat.jpg',
      word: 'Mèo',
      option1: 'Dog',
      option2: 'Cat',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/elephant.jpg',
      word: 'Voi',
      option1: 'Elephant',
      option2: 'Lion',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/lion.jpg',
      word: 'Sư tử',
      option1: 'Elephant',
      option2: 'Lion',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/tiger.jpg',
      word: 'Hổ',
      option1: 'Tiger',
      option2: 'Bear',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/bear.jpg',
      word: 'Gấu',
      option1: 'Tiger',
      option2: 'Bear',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/monkey.jpg',
      word: 'Khỉ',
      option1: 'Monkey',
      option2: 'Giraffe',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/giraffe.jpg',
      word: 'Hươu cao cổ',
      option1: 'Monkey',
      option2: 'Giraffe',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/zebra.jpg',
      word: 'Ngựa vằn',
      option1: 'Zebra',
      option2: 'Horse',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/horse.jpg',
      word: 'Ngựa',
      option1: 'Zebra',
      option2: 'Horse',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/cow.jpg',
      word: 'Bò',
      option1: 'Cow',
      option2: 'Sheep',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/sheep.jpg',
      word: 'Cừu',
      option1: 'Cow',
      option2: 'Sheep',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/pig.jpg',
      word: 'Heo',
      option1: 'Pig',
      option2: 'Goat',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/goat.jpg',
      word: 'Dê',
      option1: 'Pig',
      option2: 'Goat',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/duck.jpg',
      word: 'Vịt',
      option1: 'Duck',
      option2: 'Chicken',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/chicken.jpg',
      word: 'Gà',
      option1: 'Duck',
      option2: 'Chicken',
      option3: '',
      correctOption: 2,
    ),
    QuizQuestion(
      image: 'assets/images/frog.jpg',
      word: 'Ếch',
      option1: 'Frog',
      option2: 'Fish',
      option3: '',
      correctOption: 1,
    ),
    QuizQuestion(
      image: 'assets/images/fish.jpg',
      word: 'Cá',
      option1: 'Frog',
      option2: 'Fish',
      option3: '',
      correctOption: 2,
    ),
  ];

  final List<QuizQuestion> grammarQuestions = [
    QuizQuestion(
      image: 'assets/images/turtle.jpg',
      word: 'We found ___ turtle on the beach.',
      option1: 'a',
      option2: 'the',
      option3: 'the',
      correctOption: 3, // "the" (nói đến con rùa cụ thể)
    ),
    QuizQuestion(
      image: 'assets/images/rabbit.jpg',
      word: 'He has ___ pet rabbit at home.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a" (chưa xác định con nào)
    ),
    QuizQuestion(
      image: 'assets/images/dog.jpg',
      word: 'She adopted ___ dog from a shelter.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
    QuizQuestion(
      image: 'assets/images/cat.jpg',
      word: 'There is ___ cat sitting on the roof.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (đã xác định con mèo nào)
    ),
    QuizQuestion(
      image: 'assets/images/elephant.jpg',
      word: 'We saw ___ elephant drinking water.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 2, // "an" (elephant bắt đầu bằng nguyên âm)
    ),
    QuizQuestion(
      image: 'assets/images/lion.jpg',
      word: 'The king of the jungle is ___ lion.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (chỉ sư tử cụ thể - sư tử chúa)
    ),
    QuizQuestion(
      image: 'assets/images/tiger.jpg',
      word: 'The forest is home to ___ tiger.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
    QuizQuestion(
      image: 'assets/images/bear.jpg',
      word: 'We saw ___ bear catching fish in the river.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
    QuizQuestion(
      image: 'assets/images/monkey.jpg',
      word: 'At the zoo, we watched ___ monkey playing with its tail.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (con khỉ cụ thể trong sở thú)
    ),
    QuizQuestion(
      image: 'assets/images/giraffe.jpg',
      word: 'We saw ___ giraffe eating leaves from a tree.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 2, // "an"
    ),
    QuizQuestion(
      image: 'assets/images/zebra.jpg',
      word: 'Look at ___ zebra over there!',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (chỉ con cụ thể)
    ),
    QuizQuestion(
      image: 'assets/images/horse.jpg',
      word: 'She loves riding ___ horse every morning.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (con ngựa cụ thể của cô ấy)
    ),
    QuizQuestion(
      image: 'assets/images/cow.jpg',
      word: 'The farmer owns ___ cow that gives fresh milk.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (con bò cụ thể của người nông dân)
    ),
    QuizQuestion(
      image: 'assets/images/sheep.jpg',
      word: 'We saw ___ sheep grazing in the field.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (chỉ bầy cừu cụ thể)
    ),
    QuizQuestion(
      image: 'assets/images/pig.jpg',
      word: 'The farmer has ___ pig that loves to roll in the mud.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (con heo cụ thể của nông dân)
    ),
    QuizQuestion(
      image: 'assets/images/duck.jpg',
      word: 'There is ___ duck swimming in the pond.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
    QuizQuestion(
      image: 'assets/images/frog.jpg',
      word: 'We heard ___ frog croaking near the lake.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
    QuizQuestion(
      image: 'assets/images/fish.jpg',
      word: 'She caught ___ fish while fishing this morning.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 3, // "the" (con cá cụ thể đã bắt được)
    ),
    QuizQuestion(
      image: 'assets/images/chicken.jpg',
      word: 'My grandmother has ___ chicken in her backyard.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
    QuizQuestion(
      image: 'assets/images/goat.jpg',
      word: 'There is ___ goat standing on the hill.',
      option1: 'a',
      option2: 'an',
      option3: 'the',
      correctOption: 1, // "a"
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Xáo trộn danh sách 20 câu và chọn 10 câu đầu tiên
    List<QuizQuestion> allQuestions =
        widget.type == "vocabulary" ? vocabularyQuestions : grammarQuestions;
    allQuestions.shuffle(Random());
    questions = allQuestions.take(10).toList();
  }

  // Lấy màu cho nút theo trạng thái
  Color getOptionColor(int option) {
    if (!answerSubmitted) return Color(0xFFB2E4F6);
    if (selectedOption == option) {
      return (questions[currentQuestionIndex].correctOption == option)
          ? Colors.green
          : Colors.red;
    }
    return Color(0xFFB2E4F6);
  }

  void _handleAnswer(int option) {
    if (answerSubmitted) return;
    setState(() {
      selectedOption = option;
      answerSubmitted = true;
      if (questions[currentQuestionIndex].correctOption == option) {
        correctCount++;
      }
    });
    // Chuyển câu sau 1 giây
    Timer(Duration(seconds: 1), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        answerSubmitted = false;
      });
    } else {
      // Khi hết câu hỏi, chuyển sang ChallengeCompleteScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChallengeCompleteScreen(
              correctCount: correctCount,
              totalQuestions: questions.length,
              lesson: widget.lesson),
        ),
      );
    }
  }

  Widget _buildQuestionContent(QuizQuestion currentQuestion) {
    return Container(
      key: ValueKey<int>(currentQuestionIndex),
      child: Column(
        children: [
          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: widget.mainColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: (currentQuestionIndex + 1) / questions.length,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF8ED7F1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${currentQuestionIndex + 1}/${questions.length}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          // Tiêu đề
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
          SizedBox(height: 40),
          // Hình ảnh
          Image.asset(
            currentQuestion.image,
            fit: BoxFit.contain,
            height: 263,
          ),
          SizedBox(height: 15),
          // Từ cần chọn
          Center(
            child: Expanded(
              child: Text(
                currentQuestion.word,
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center, // Căn giữa văn bản
                softWrap: true, // Cho phép xuống dòng
              ),
            ),
          ),
          widget.type == 'vocabulary' ? SizedBox(height: 80) : SizedBox(height: 10),
          // 2 nút đáp án
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Nút đáp án 1
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: widget.type == 'vocabulary' ? 340 : 280,
                        height: widget.type == 'vocabulary'
                            ? 95
                            : 80, // Tăng nhẹ chiều cao nếu không phải vocabulary
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getOptionColor(1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () => _handleAnswer(1),
                          child: Text(
                            currentQuestion.option1,
                            style: TextStyle(
                              fontSize: widget.type == 'vocabulary' ? 27 : 22,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),

                      SizedBox(height: 16), // Thêm khoảng cách

                      // Nút đáp án 2
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: widget.type == 'vocabulary' ? 340 : 280,
                        height: widget.type == 'vocabulary' ? 95 : 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getOptionColor(2),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () => _handleAnswer(2),
                          child: Text(
                            currentQuestion.option2,
                            style: TextStyle(
                              fontSize: widget.type == 'vocabulary' ? 27 : 22,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),

                      if (widget.type != 'vocabulary') ...[
                        SizedBox(
                            height: 16), // Thêm khoảng cách nếu có nút thứ 3

                        // Nút đáp án 3
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 280,
                          height: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: getOptionColor(3),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () => _handleAnswer(3),
                            child: Text(
                              currentQuestion.option3,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // Sử dụng AnimatedSwitcher với hiệu ứng slide sang phải (vào từ bên phải)
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          final slideAnimation = Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
        child: _buildQuestionContent(currentQuestion),
      ),
    );
  }
}
