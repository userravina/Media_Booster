import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_app/Spotify_app/View/First_Screen.dart';
import 'package:spotify_app/Spotify_app/View/Library_Screen.dart';
import 'package:spotify_app/Spotify_app/View/Music_Screen.dart';
import 'package:spotify_app/Spotify_app/modal/Music_modal.dart';

import '../View/Search/search_Screen.dart';

class Music_provider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  bool isPlay = false;
  int? musicindex;
  int cleack = 0;
  int index = 0;

  Duration TotalDuration = Duration(seconds: 0);

  List<Audio> Musiclist = [
    Audio("assets/Music/ke1.mp3"),
    Audio("assets/Music/ke.mp3"),
    Audio("assets/Music/ke3.mp3"),
    Audio("assets/Music/ke4 .mp3"),
  ];

  List<Audio> Musiclist2 = [
    Audio("assets/Music/ml1.mp3"),
    Audio("assets/Music/ml2.mp3"),
    Audio("assets/Music/ml3.mp3"),
    Audio("assets/Music/ml4.mp3"),
  ];

  List<Audio> Musiclist3 = [
    Audio("assets/Music/n1.mp3"),
    Audio("assets/Music/n2.mp3"),
    Audio("assets/Music/n3.mp3"),
    Audio("assets/Music/n4.mp3"),
  ];

  List<Music_modal> name = [
    Music_modal(
      singname: "Arijit Singh",
      songname: "Apna Bana Le..",
      img: "assets/images/l1.jpeg",
      song: Audio("assets/Music/1.mp3"),
    ),
    Music_modal(
        singname: "Arijit Singh",
        songname: "Kesariya..",
        img: "assets/images/l2.jpeg"),
    Music_modal(
      singname: " King",
      songname: "Mann Meri Jaan",
      img: "assets/images/name2.jpeg",
      song: Audio("assets/Music/1.mp3"),
    ),
    Music_modal(
        singname: "King",
        songname: "Lehnga..",
        img: "assets/images/name22.jpeg"),
    Music_modal(
        singname: "Neha Kakkar",
        songname: "Baarish Mein Tum..",
        img: "assets/images/l3.jpeg"),
    Music_modal(
        singname: "Neha Kakkar",
        songname: "Maahi Ve Unplugge..",
        img: "assets/images/l4.jpeg"),
    Music_modal(
        singname: "Amaal Mallik",
        songname: "Kaun Tujhe Song",
        img: "assets/images/name4.jpeg"),
    Music_modal(
        singname: "Neha Kakkar",
        songname: "Ek din pyar..",
        img: "assets/images/name5.jpeg"),
  ];

  List<Music_modal> name2 = [];

  List<Music_modal> name3 = [
    Music_modal(
        singname: "Armaan Malik",
        songname: "Bol Do Na Zara..",
        img: "assets/images/31.jpg"),
    Music_modal(
        singname: "Shreya Ghoshal",
        songname: "Haan Hasi Ban Gaye..",
        img: "assets/images/32.jpeg"),
    Music_modal(
        singname: "Kumar Sanu",
        songname: "Churaake Dil Mera",
        img: "assets/images/33.jpeg"),
    Music_modal(
        singname: "Alka Yagnik",
        songname: "Bole Chudiyan ..",
        img: "assets/images/34.jpeg"),
  ];

  // CarouselSlider

  List imageslider = [
    "assets/images/31.jpg",
    "assets/images/32.jpeg",
    "assets/images/33.jpeg",
    "assets/images/34.jpeg"
  ];

  int sliderindex = 0;

  void changeslider(int index)
  {
    sliderindex = index;
    notifyListeners();
  }

  // bottom
  var i = 0;

  List Screens = [
    First_Screen(),
    SearchScreen(),
    Library(),
  ];

  void change(int index) {
    i = index;
    notifyListeners();
  }

  // initMusic
  void initMusic() {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(
      Playlist(audios: Musiclist, startIndex: index),
      autoStart: false,
      showNotification: true,
    );
    duration();
  }

// StratMusic
  void StartMusic() {
    assetsAudioPlayer!.play();
    isPlay = true;
    notifyListeners();
  }

// StopeMusic
  void puseMusic() {
    assetsAudioPlayer!.pause();
    isPlay = false;
    notifyListeners();
  }

// Duration

  duration() {
    assetsAudioPlayer!.current.listen((event) {
      TotalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

// nextAudio

  void nextAudio() {
    assetsAudioPlayer!.next();
    if (cleack < 7) {
      cleack++;
    }
    isPlay = true;
    notifyListeners();
  }

// previes
  void preAudio() {
    assetsAudioPlayer!.previous();
    if (cleack > 0) {
      cleack--;
    }
    isPlay = true;
    notifyListeners();
  }

  int pageindex = 0;

  void bottomnavigation(int value) {
    pageindex = value;
    notifyListeners();
  }
}
