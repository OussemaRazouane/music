import 'package:flutter/material.dart';
import 'package:music/constant/const.dart';
import 'package:music/models/music.dart';
import 'package:music/widgets/instans.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor:bgColor,
        title:Row(
          children: [
            const Icon(Icons.home, color: Colors.white, size: 30),
            const SizedBox(width: 5),
            RichText(
              text:const TextSpan(
                children: <TextSpan>[
                  TextSpan(text:'TRACKS',style: TextStyle(color: Colors.white,fontSize:25)),
                  TextSpan(text: 'ARTISTS',style: TextStyle(color: Color.fromARGB(255, 106, 105, 105),fontSize:25)),
                  TextSpan(text: 'ALBUMS',style: TextStyle(color: Color.fromARGB(255, 106, 105, 105),fontSize:25)),
                ] 
              ),
            ),
          ],
        ),
      ),
      body:ListView.builder(
        physics:const BouncingScrollPhysics(),
        itemCount: musics.length,
        itemBuilder:(context,index){
          return SelectedMusic(i:index,);
      }),
      bottomNavigationBar:const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Icon(Icons.list,size:40,color:Colors.grey),
          Icon(Icons.bookmark,size:40,color:titleColor),
          Icon(Icons.search,size:40,color:titleColor),
          Icon(Icons.generating_tokens_rounded,size:40,color:titleColor),
          Icon(Icons.settings,size:40,color:titleColor),
        ]
      ),
    );
  }
}