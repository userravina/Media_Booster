import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_app/Spotify_app/Provider/Music_provider.dart';
import 'package:spotify_app/Spotify_app/modal/Music_modal.dart';

class Music_Screen extends StatefulWidget {
  const Music_Screen({Key? key}) : super(key: key);

  @override
  State<Music_Screen> createState() => _Music_ScreenState();
}

Music_provider? providerF;
Music_provider? providerT;

class _Music_ScreenState extends State<Music_Screen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Music_provider>(context, listen: false).initMusic();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Music_provider>(context, listen: false);
    providerT = Provider.of<Music_provider>(context, listen: true);
    int d= ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff4b3952),
      body: Stack(children: [
        Image.asset(
          "assets/images/music.png",
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back, color: Colors.white),
              Text(
                "PLAYING FROM PLAYLIST",
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.more_vert, color: Colors.white)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 230),
              child: Container(
                height: 30.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage("${providerF!.name[providerT!.cleack].img}"),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 530, left: 25),
          child: Row(
            children: [
              Text(
                "${providerF!.name[providerT!.cleack].songname}",
                style: TextStyle(
                    color: Colors.white, fontSize: 20, letterSpacing: 1),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 560, left: 25),
          child: Row(
            children: [
              Text(
                "${providerF!.name[providerT!.cleack].singname}",
                style: TextStyle(
                    color: Colors.white, fontSize: 15, letterSpacing: 1),
              )
            ],
          ),
        ),
        PlayerBuilder.currentPosition(
          player: providerT!.assetsAudioPlayer!,
          builder: (context, duration) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 570),
                    child: Slider(
                      activeColor: Color(0xffa189b7),
                      inactiveColor: Colors.grey,
                      value: duration.inSeconds.toDouble(),
                      max: providerT!.TotalDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        providerF!.assetsAudioPlayer!
                            .seek(Duration(seconds: value.toInt()));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${duration}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("${providerT!.TotalDuration}",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 650, left: 25, right: 25),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shuffle, color: Colors.white, size: 20.sp)),
            IconButton(
              onPressed: () {
                providerT!.preAudio();
              },
              icon: Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  if (providerT!.assetsAudioPlayer!.isPlaying.value) {
                    providerT!.puseMusic();
                  } else {
                    providerT!.StartMusic();
                  }
                },
                child: providerT!.isPlay
                    ? Icon(Icons.pause_outlined, color: Colors.black)
                    : Icon(Icons.play_arrow, color: Colors.black)),
            IconButton(
              onPressed: () {
                providerF!.nextAudio();
                // print("$d ====================================== ${providerF!.index}");
              },
              icon: Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.repeat, color: Colors.white, size: 20.sp)),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 710, left: 40, right: 40),
          child: Row(
            children: [
              Icon(Icons.speaker_group_outlined,
                  size: 18.sp, color: Colors.white),
              Spacer(),
              Icon(Icons.share, color: Colors.white, size: 15.sp),
              SizedBox(width: 10),
              Icon(Icons.menu, color: Colors.white, size: 15.sp),
            ],
          ),
        ),
      ]),
    ));
  }
}
