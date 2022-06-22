import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/to_do_list/screens/home_screen.dart';


class Splash extends StatefulWidget{
  @override
  _SplashState createState()  => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
          (route) => true));
  }

  Widget build(BuildContext context) {
    return Scaffold(body:
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                    radius: 40,
                    child: Icon(Icons.check_rounded,
                    color: Color(0xffac255e),
                    size: 60.0,),),
                    Padding(padding: EdgeInsets.only(top: 20.0),),
                    Text("Task Manager", style: TextStyle(
                        color: Colors.grey, fontSize: 20.0),)
                  ],),),),
            Expanded(
                child: Container(
                    color: Colors.white,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[Padding(padding: EdgeInsets.only(top: 20.0)),
                        Text("Flutter technologies", style: TextStyle(
                          color: Colors.black54, fontSize: 17.0,
                        ),),
                        Padding(padding: EdgeInsets.only(bottom: 60.0),)
                      ],
                    ),),),
          ],),
    ),);
  }
}