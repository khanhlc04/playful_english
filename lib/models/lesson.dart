import 'package:flutter/material.dart'; 

class Lesson {
  final String id;
  final String title;      
  final String highScore;  
  final String progress;   
  final Color color;       
  final String image;      

  Lesson({
    required this.id,
    required this.title,
    required this.highScore,
    required this.progress,
    required this.color,
    required this.image,
  });
}
