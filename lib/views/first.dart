import 'package:flutter/material.dart';
import 'package:music/constant/const.dart';
import 'package:music/views/home.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
    @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:AssetImage("assets/logo.png")),
          RefreshProgressIndicator(color:bgColor ,backgroundColor:textColor,)
        ],
      ),
    );
  }
}