import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:playful_english/models/lesson.dart';
import 'package:playful_english/pages/challengeComplete_page.dart';

void main() {
  runApp(MemoryGameApp());
}

class MemoryGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MemoryGameScreen(),
    );
  }
}

class MemoryGameScreen extends StatefulWidget {
  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  List<Map<String, String>> words = [
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

  List<Map<String, String>> items = [];
  List<Map<String, String>> gameCards = [];
  List<bool> cardFlipped = [];
  Set<int> matchedCards = {};
  int firstIndex = -1;
  int secondIndex = -1;
  bool isChecking = false;
  List<Map<String, String>> matchedPairs = [];

  @override
  void initState() {
    super.initState();
    words.shuffle(Random());
    items = words.sublist(0, 6);
    setupGame();
  }

  void setupGame() {
    gameCards.clear();
    matchedPairs.clear();
    items.forEach((item) {
      gameCards.add({"type": "word", "value": item["word"]!});
      gameCards.add(
          {"type": "image", "value": item["image"]!, "word": item["word"]!});
    });
    gameCards.shuffle(Random());
    cardFlipped = List.generate(gameCards.length, (index) => false);
    matchedCards.clear();
    setState(() {});
  }

  void onCardTap(int index) {
    if (isChecking || cardFlipped[index] || matchedCards.contains(index))
      return;

    setState(() {
      cardFlipped[index] = true;
      if (firstIndex == -1) {
        firstIndex = index;
      } else {
        secondIndex = index;
        isChecking = true;
        Timer(Duration(seconds: 1), checkMatch);
      }
    });
  }

  void checkMatch() {
    if ((gameCards[firstIndex]["type"] == "word" &&
                gameCards[secondIndex]["type"] == "image" ||
            gameCards[firstIndex]["type"] == "image" &&
                gameCards[secondIndex]["type"] == "word") &&
        (gameCards[firstIndex]["value"] == gameCards[secondIndex]["word"] ||
            gameCards[secondIndex]["value"] == gameCards[firstIndex]["word"])) {
      matchedCards.add(firstIndex);
      matchedCards.add(secondIndex);
      matchedPairs.add({
        "word": gameCards[firstIndex]["type"] == "word"
            ? gameCards[firstIndex]["value"]!
            : gameCards[secondIndex]["value"]!,
        "image": gameCards[firstIndex]["type"] == "image"
            ? gameCards[firstIndex]["value"]!
            : gameCards[secondIndex]["value"]!
      });
    } else {
      setState(() {
        cardFlipped[firstIndex] = false;
        cardFlipped[secondIndex] = false;
      });
    }
    setState(() {
      firstIndex = -1;
      secondIndex = -1;
      isChecking = false;
    });

    checkGameComplete();
  }

  void checkGameComplete() {
    if (matchedCards.length == gameCards.length) {
      // Chuyển đến màn hình ChallengeCompleteScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChallengeCompleteScreen(
            correctCount: matchedCards.length ~/ 2,
            totalQuestions: items.length,
            lesson: Lesson(
              id: '1',
              title: 'Lesson 1: Animals',
              highScore: '90/100',
              progress: '3/4',
              color: Color(0xFFFCD195),
              image: 'assets/images/bear-4.png',
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/jungle.jpg'), // Đặt đường dẫn đến ảnh nền
            fit: BoxFit.cover, // Chỉnh kích thước ảnh cho phù hợp
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 140,
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: gameCards.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onCardTap(index),
                    child: matchedCards.contains(index)
                        ? SizedBox.shrink()
                        : Card(
                            color: cardFlipped[index]
                                ? Colors.white
                                : Colors.blueAccent,
                            child: Center(
                              child: cardFlipped[index]
                                  ? (gameCards[index]["type"] == "word"
                                      ? Text(
                                          gameCards[index]["value"]!,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Image.asset(gameCards[index]["value"]!,
                                          fit: BoxFit.cover))
                                  : Container(),
                            ),
                          ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: matchedPairs.map((pair) {
                  return ListTile(
                    leading: Image.asset(
                      pair["image"]!,
                    ),
                    title: Text(pair["word"]!,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: setupGame,
        child: Icon(Icons.refresh),
      ),
    );
  }
}