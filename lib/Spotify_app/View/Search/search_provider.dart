import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreenProvider extends ChangeNotifier{
  List Language = [
    "Podcasts",
    "Live Events",
    "Made For You",
    "New Releases",
    "Hindi",
    "Punjabi",
    "Tamil",
    "Telugu",
    "Charts",
    "Pop",
    "Indie",
    "Trending",
    "Love",
    "Discover",
    "Radio",
    "Mood",
    "Party",
    "Devotional",
    "Decades",
    "Hip-Hop",
    "Student",
    "Chill",
    "Gaming",
    "Rock",
  ];

  List<Color> colors = [
    Colors.red,
    Colors.purple.shade300,
    Colors.blue.shade900,
    Colors.pink,
    Colors.red.shade300,
    Colors.purple.shade700,
    Colors.brown,
    Colors.orange,
    Colors.red,
    Colors.purple.shade300,
    Colors.blue.shade900,
    Colors.pink,
    Colors.red.shade300,
    Colors.purple.shade700,
    Colors.brown,
    Colors.orange,
    Colors.red,
    Colors.purple.shade300,
    Colors.blue.shade900,
    Colors.pink,
    Colors.red.shade300,
    Colors.purple.shade700,
    Colors.brown,
    Colors.orange,
  ];
}