import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Profile(),
    theme: ThemeData(),
  ));
}

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold( floatingActionButton: FloatingActionButton(
        onPressed: (){
      setState(() {
        counter = counter + 1;
      });
    },
        child: Container(width: 60, height: 60,
            child: Icon(Icons.add),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors:<Color>[
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ],)
            )
        )
    ),

    body: Stack(
    children: [ Column(
    children: [
      Expanded(
      flex:5,
      child:Container( width: double.infinity, decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ],),),),),
      Expanded(
          flex:5,
          child: Container(
              color: Colors.grey[200],
              child: Center(
                  child:Card(
                      margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),  // gives margin top from upper element
                      child: Container(width: 310.0, height:290.0,
                          child: Padding(padding: EdgeInsets.all(10.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, // moves text to side ways
                              children: [Text("Information",
                                style: TextStyle(
                                  fontSize: 17.0,
                                //  fontWeight: FontWeight.w800,
                                ),),
                                Divider(color: Colors.grey[300],),
                                /*SizedBox(width: 40.0,),*/
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.home, color: Colors.blueAccent[400], size: 35,),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Guild",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("FairyTail, Magnolia",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],)
                                  ],),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Colors.yellowAccent[400],
                                      size: 35,),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Magic",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Spatial & Sword magic, Telekiness",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],)
                                  ],),

                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.pinkAccent[400],
                                      size: 35,),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Love",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Eating cakes",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],)
                                  ],),

                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.lightGreen[400],
                                      size: 35,),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Team",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Team Natasu",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],)
                                  ],),




                              ],),)))))),
    ]),
      Positioned(
          top:MediaQuery.of(context).size.height*0.45,
          left: 20.0,
          right: 20.0,
          child: Card(
              child: Padding(
                  padding:EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child:Column(
                              children: [
                                Text('Battles',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.0
                                  ),),
                                SizedBox(height: 5.0,),
                                Text("$counter",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),)
                              ],
                            )
                        ),

                        Container(
                            child:Column(
                              children: [
                                Text('Birthday',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.0
                                  ),),
                                SizedBox(height: 8.0,),
                                Text("November 6th",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),)
                              ],
                            )
                        ),
                        Container(
                            child:Column(
                              children: [
                                Text('Age',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.0
                                  ),),
                                SizedBox(height: 8.0,),
                                Text("22",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),)
                              ],
                            )
                        ),
                      ]
                  )
              )))
    ]));
  }
}
