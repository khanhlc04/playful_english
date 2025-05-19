import 'package:flutter/material.dart';
import 'package:playful_english/models/lesson.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'exercise.dart';

class StudyScreen extends StatefulWidget {
  final String type;
  final Color mainColor;
  final Lesson lesson;

  StudyScreen(
      {required this.type, required this.mainColor, required this.lesson});

  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int currentIndex = 0;
  late FlutterTts flutterTts;

  final List<Map<String, String>> vocabularyList = [
    {
      "word": "Turtle",
      "pronunciation": "/ˈtɜːrtl/",
      "meaning": "Rùa",
      "image": "assets/images/turtle.jpg"
    },
    {
      "word": "Rabbit",
      "pronunciation": "/ˈræbɪt/",
      "meaning": "Thỏ",
      "image": "assets/images/rabbit.jpg"
    },
    {
      "word": "Dog",
      "pronunciation": "/dɔːɡ/",
      "meaning": "Chó",
      "image": "assets/images/dog.jpg"
    },
    {
      "word": "Cat",
      "pronunciation": "/kæt/",
      "meaning": "Mèo",
      "image": "assets/images/cat.jpg"
    },
    {
      "word": "Elephant",
      "pronunciation": "/ˈɛlɪfənt/",
      "meaning": "Voi",
      "image": "assets/images/elephant.jpg"
    },
    {
      "word": "Lion",
      "pronunciation": "/ˈlaɪən/",
      "meaning": "Sư tử",
      "image": "assets/images/lion.jpg"
    },
    {
      "word": "Tiger",
      "pronunciation": "/ˈtaɪɡər/",
      "meaning": "Hổ",
      "image": "assets/images/tiger.jpg"
    },
    {
      "word": "Bear",
      "pronunciation": "/bɛr/",
      "meaning": "Gấu",
      "image": "assets/images/bear.jpg"
    },
    {
      "word": "Monkey",
      "pronunciation": "/ˈmʌŋki/",
      "meaning": "Khỉ",
      "image": "assets/images/monkey.jpg"
    },
    {
      "word": "Giraffe",
      "pronunciation": "/dʒɪˈræf/",
      "meaning": "Hươu cao cổ",
      "image": "assets/images/giraffe.jpg"
    },
    {
      "word": "Zebra",
      "pronunciation": "/ˈziːbrə/",
      "meaning": "Ngựa vằn",
      "image": "assets/images/zebra.jpg"
    },
    {
      "word": "Horse",
      "pronunciation": "/hɔːrs/",
      "meaning": "Ngựa",
      "image": "assets/images/horse.jpg"
    },
    {
      "word": "Cow",
      "pronunciation": "/kaʊ/",
      "meaning": "Bò",
      "image": "assets/images/cow.jpg"
    },
    {
      "word": "Sheep",
      "pronunciation": "/ʃiːp/",
      "meaning": "Cừu",
      "image": "assets/images/sheep.jpg"
    },
    {
      "word": "Pig",
      "pronunciation": "/pɪɡ/",
      "meaning": "Heo",
      "image": "assets/images/pig.jpg"
    },
    {
      "word": "Duck",
      "pronunciation": "/dʌk/",
      "meaning": "Vịt",
      "image": "assets/images/duck.jpg"
    },
    {
      "word": "Frog",
      "pronunciation": "/frɒɡ/",
      "meaning": "Ếch",
      "image": "assets/images/frog.jpg"
    },
    {
      "word": "Fish",
      "pronunciation": "/fɪʃ/",
      "meaning": "Cá",
      "image": "assets/images/fish.jpg"
    },
    {
      "word": "Chicken",
      "pronunciation": "/ˈtʃɪkɪn/",
      "meaning": "Gà",
      "image": "assets/images/chicken.jpg"
    },
    {
      "word": "Goat",
      "pronunciation": "/ɡoʊt/",
      "meaning": "Dê",
      "image": "assets/images/goat.jpg"
    }
  ];

  final List<Map<String, String>> grammarList = [
    {
      "word": "a",
      "pronunciation": "/ə/",
      "meaning":
          "Một (dùng trước danh từ số ít, không xác định, bắt đầu bằng phụ âm)",
      "example": "I have a book. (Tôi có một quyển sách.)",
      "explanation":
          "Dùng 'a' khi nói về một vật gì đó không cụ thể và danh từ bắt đầu bằng một phụ âm (b, c, d, f, g, ...).",
      "image": "assets/images/AAnThe.jpg"
    },
    {
      "word": "an",
      "pronunciation": "/æn/",
      "meaning":
          "Một (dùng trước danh từ số ít, không xác định, bắt đầu bằng nguyên âm)",
      "example": "I ate an apple. (Tôi đã ăn một quả táo.)",
      "explanation":
          "Dùng 'an' khi nói về một vật gì đó không cụ thể và danh từ bắt đầu bằng một nguyên âm (a, e, i, o, u) hoặc âm câm như 'hour' (/aʊər/).",
      "image": "assets/images/AAnThe.jpg"
    },
    {
      "word": "the",
      "pronunciation": "/ðə/ hoặc /ðiː/ (trước nguyên âm)",
      "meaning":
          "Cái, con, người (dùng trước danh từ đã xác định hoặc duy nhất)",
      "example": "The sun is bright today. (Mặt trời hôm nay sáng chói.)",
      "explanation":
          "Dùng 'the' khi nói về một vật hoặc người đã được xác định cụ thể hoặc là duy nhất, như 'the sun' (mặt trời), 'the moon' (mặt trăng), hoặc 'the teacher' (người giáo viên mà cả người nói và người nghe đều biết).",
      "image": "assets/images/AAnThe.jpg"
    }
  ];

  void navigateNext() {
    setState(() {
      if (currentIndex < 19) {
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
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  void speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> currentList =
        widget.type == "vocabulary" ? vocabularyList : grammarList;
    final currentItem = currentList[currentIndex];
    double progress = (currentIndex + 1) / currentList.length;

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
            // Thanh tiến trình
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
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF8ED7F1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${currentIndex + 1}/${currentList.length}',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tiêu đề
            Text(
              widget.type == "vocabulary"
                  ? 'Danh sách từ vựng'
                  : 'Bài học ngữ pháp',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF7D6A6),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Nếu là từ vựng, hiển thị hình ảnh
            if (widget.type == "vocabulary")
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: widget.mainColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  currentItem['image']!,
                  fit: BoxFit.contain,
                  height: 180,
                ),
              ),

            SizedBox(height: 20),

            // Nội dung hiển thị khác nhau dựa vào loại bài học
            widget.type == "vocabulary"
                ? Column(
                    children: [
                      // Từ vựng + Nút phát âm
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentItem['word']!,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            onPressed: () => speak(currentItem['word']!),
                            icon: Icon(Icons.volume_up,
                                color: Color(0xFF8ED7F1), size: 30),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentItem['pronunciation']!,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentItem['meaning']!,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentItem['word'] ?? 'Không có từ',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentItem['pronunciation'] ?? 'Không có phiên âm',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentItem['meaning'] ?? 'Không có nghĩa',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentItem['example'] ?? 'Không có ví dụ',
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentItem['explanation'] ?? 'Không có giải thích',
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                      SizedBox(height: 20),
                      if (currentItem['image'] != null)
                        Image.asset(
                          currentItem['image']!,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                    ],
                  ),

            SizedBox(height: 80),

            // Nút điều hướng
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentIndex > 0)
                  ElevatedButton(
                    onPressed: navigatePrevious,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB2E4F6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(120, 50),
                    ),
                    child: Text('Trước', style: TextStyle(fontSize: 16)),
                  ),
                SizedBox(width: 50),
                if (currentIndex < currentList.length - 1)
                  ElevatedButton(
                    onPressed: navigateNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB2E4F6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(120, 50),
                    ),
                    child: Text('Sau', style: TextStyle(fontSize: 16)),
                  ),
                if (currentIndex == currentList.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseScreen(
                              type: widget.type,
                              mainColor: widget.mainColor,
                              lesson: widget.lesson),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(120, 50),
                    ),
                    child: Text('Kiểm tra', style: TextStyle(fontSize: 16)),
                  ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
