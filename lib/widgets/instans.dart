import 'package:flutter/material.dart';
import 'package:music/constant/const.dart';
import 'package:music/models/music.dart';
import 'package:music/views/music_secreen.dart';

class SelectedMusic extends StatefulWidget {
  const SelectedMusic({super.key,required this.i});
  final int i;
  @override
  State<SelectedMusic> createState() => _SelectedMusicState();
}

class _SelectedMusicState extends State<SelectedMusic> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context) =>MusicScreen(i:widget.i,),
          ),
        );
      },
      child:Padding(
        padding:const EdgeInsets.all(2.0),
        child:ListTile(
          leading:Image(image:AssetImage(musics[widget.i].image)),
          title: Text(musics[widget.i].title,style:const TextStyle(color:textColor),),
          subtitle: Text(musics[widget.i].artist,style:const TextStyle(color:Colors.grey),),
          trailing:const Icon(Icons.more_vert, color: Colors.grey),
        ),
      ) ,
    );
  }
}