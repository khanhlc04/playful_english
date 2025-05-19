import 'package:flutter/material.dart';
import 'package:playful_english/models/lesson.dart';
import 'package:playful_english/pages/challengeComplete_page.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final Lesson lesson;

  StoryScreen(
      {required this.lesson});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;
  bool _showQuestions = false;
  double _playbackSpeed = 1.0;
  Map<int, String> selectedAnswers = {}; // Lưu các câu trả lời đã chọn

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/tortoise_hare.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      })
      ..addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          setState(() => _showQuestions = true);
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void _changeSpeed() {
    setState(() {
      _playbackSpeed = _playbackSpeed >= 2.0 ? 0.5 : _playbackSpeed + 0.5;
      _controller.setPlaybackSpeed(_playbackSpeed);
    });
  }

  void _selectAnswer(int index, String answer, String correctAnswer) {
    if (selectedAnswers.containsKey(index)) return; // Không cho chọn lại

    setState(() {
      selectedAnswers[index] = answer;

      // Nếu đã chọn hết câu hỏi thì chuyển trang
      if (selectedAnswers.length == questions.length) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChallengeCompleteScreen(
                correctCount: selectedAnswers.entries.where((entry) => entry.value == questions[entry.key]["correct"]).length,
                totalQuestions: questions.length,
                lesson: widget.lesson,
              ),
            ),
          );
        });
      }
    });
  }

  List<Map<String, dynamic>> questions = [
    {"question": "Who won the race?", "answers": ["Tortoise", "Hare"], "correct": "Tortoise"},
    {"question": "Who was overconfident?", "answers": ["Hare", "Tortoise"], "correct": "Hare"},
    {"question": "What did the hare do during the race?", "answers": ["Ran fast", "Took a nap"], "correct": "Took a nap"},
    {"question": "What is the moral of the story?", "answers": ["Slow and steady wins", "Speed is everything"], "correct": "Slow and steady wins"},
    {"question": "Who was slow but steady?", "answers": ["Tortoise", "Hare"], "correct": "Tortoise"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Story: The Tortoise and the Hare")),
      body: Column(
        children: [
          if (!_showQuestions)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              color: Colors.black54,
              child: Text(
                "🎥 Hãy xem hết video để nhận câu hỏi trắc nghiệm!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow), onPressed: _togglePlayPause),
              Text("Tốc độ: ${_playbackSpeed}x"),
              IconButton(icon: Icon(Icons.speed), onPressed: _changeSpeed),
            ],
          ),
          Expanded(child: _showQuestions ? buildQuestions() : Container()),
        ],
      ),
    );
  }

  Widget buildQuestions() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          var q = questions[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(q["question"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (q["answers"] as List<String>).map((answer) {
                      bool isSelected = selectedAnswers[index] == answer;
                      bool isCorrect = answer == q["correct"];

                      return ElevatedButton(
                        onPressed: selectedAnswers.containsKey(index) ? null : () => _selectAnswer(index, answer, q["correct"]),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            isSelected ? (isCorrect ? Colors.green : Colors.red) : null,
                          ),
                        ),
                        child: Text(answer),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}