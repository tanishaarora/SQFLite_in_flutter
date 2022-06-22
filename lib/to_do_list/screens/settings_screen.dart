import 'package:flutter/material.dart';
import 'package:flutter_demo/to_do_list/screens/home_screen.dart';

class Settings extends StatefulWidget{
  @override
  _SettingsState createState() =>  _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,  color: Colors.black),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()))),
        title: Text('Settings',
          style: TextStyle(
              color: Color(0xffac255e),
              fontSize: 20.0,
              fontWeight: FontWeight.normal),),
      elevation: 0),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 25.0),
          child: Container(
              width: double.infinity,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 65,
                        width: 65,
                        color: Color(0xffac255e),
                        child: Icon(Icons.check_rounded, size: 35,color: Colors.white,),),),

                    SizedBox(height: 20,),

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: new Text(
                            "Task Manager",
                            style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 25.0, right: 20.0, bottom: 60.0),
                      child: new Container(
                          alignment: Alignment.center,
                          child: new Text("Version: 1.0.3",
                              style:
                              new TextStyle(fontSize: 12.0, color: Colors.grey))),
                    ),
                    SizedBox(
                      width: 1080,
                      height: 1,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.black12),
                      ),
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 40.0, right: 20.0, bottom: 30.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: new Container(
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    decoration: new BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: new BorderRadius.circular(9.0)),
                                    child: new Text("CLEAR ALL DATA",
                                        style: new TextStyle(
                                            fontSize: 15.0, color: Colors.white))),
                              ),
                            ),
                          ),
                        ]),

                    SizedBox(
                      width: 1080,
                      height: 1,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.black12),
                      ),
                    ),

                    Padding(padding: const EdgeInsets.only(left: 40, right: 20, top: 20),
                    child: Container(
                      alignment:  Alignment.centerLeft,
                      height: 40,
                    child: InkWell(child: Text('Terms & Condition',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                      ),),),),),

                    Padding(padding: const EdgeInsets.only(left: 40, right: 20, top: 20, bottom: 20),
                      child: Container(
                        alignment:  Alignment.centerLeft,
                        height: 40,
                        child: InkWell(child: Text('Privacy Policy',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                          ),),),),),


                    SizedBox(height: 1,
                      width: 1000,
                    child: const DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Colors.black12)),),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: new Text("Flutter Development ",
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.black54)),
                          ),
                        ],
                      ),
                    )

                    /*Padding(padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        height: 40,
                        child: InkWell(child: Text('Flutter Development',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),),),),),*/

      /*Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 16,),
          CircleAvatar(child: Icon(Icons.check_rounded, size: 35,color: Colors.white,),
          maxRadius: 35,
          backgroundColor: Color(0xffac255e),),

          SizedBox(height: 20,),

          Text('Task Manager', style:
          TextStyle(
            fontSize: 30,
            color: Colors.grey,
            fontWeight: FontWeight.normal
          ),),
          
          Text('Version : 2.0.8',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey),),

          SizedBox(height: 60,),

           Divider(
            indent: 30.0,
             endIndent: 30.0,
             color: Colors.grey,
             thickness: 1,
          ),


        Container(
            alignment: Alignment.center,
            height: 40.0,
            decoration: new BoxDecoration(
                color: Colors.grey,
                borderRadius: new BorderRadius.circular(9.0)),
            child: new Text("CLEAR ALL DATA",
                style: new TextStyle(
                    fontSize: 15.0, color: Colors.white)),),
        ],
      ),),*/
    ]))));
  }
}
