import 'package:flutter/material.dart';
import 'package:music/constant/const.dart';
import 'package:music/models/music.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key, required this.i});
  final int i;
  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late int index;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        if (state == PlayerState.playing) {
          isPlaying = true;
        } else {
          isPlaying = false;
        }
      });
    });
    player.onDurationChanged.listen((du) {
      setState(() {
        duration = du;
      });
    });
    player.onPositionChanged.listen((pos) {
      setState(() {
        position = pos;
      });
    });
    index = widget.i;
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    if (index == musics.length - 1) {
      index = 0;
    } else {
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.updateScreenDimensions(context: context);
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: ScreenSize.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: titleColor,
                ),
                child: Image(
                  image: AssetImage(musics[index].image),
                  fit: BoxFit.cover,
                )),
            Text(musics[index].title,
                style: const TextStyle(fontSize: 27, color: textColor)),
            Text(musics[index].artist,
                style: const TextStyle(fontSize: 20, color: textColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(position.toString().substring(2, 7),
                    style: const TextStyle(fontSize: 20, color: textColor)),
                Slider(
                  inactiveColor: bgColor,
                  activeColor: textColor,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (val) async {
                    player.seek(
                      Duration(
                        seconds: val.round(),
                      ),
                    );
                  },
                ),
                Text(duration.toString().substring(2, 7),
                    style: const TextStyle(fontSize: 20, color: textColor)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const Icon(Icons.skip_previous_rounded,color:textColor),
                    onPressed: () {
                      // previous song
                      if (index == 0) {
                        index = musics.length - 1;
                      } else {
                        index--;
                      }
                      player.play(AssetSource(musics[index].music));
                    }),
                IconButton(
                  onPressed: () {
                    if (!isPlaying) {
                      player.play(AssetSource(musics[index].music));
                    } else {
                      player.pause();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.play_arrow : Icons.pause,color:textColor),
                ),
                IconButton(
                    icon: const Icon(Icons.skip_next_rounded,color:textColor),
                    onPressed: () {
                      // next song
                      if (index == musics.length - 1) {
                        index = 0;
                      } else {
                        index++;
                      }
                      player.play(AssetSource(musics[index].music));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
