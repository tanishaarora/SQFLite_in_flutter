import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Login.dart';
import 'package:flutter_demo/to_do_list/splash_screen.dart';
import 'Registration.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration:const BoxDecoration(
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
            ],
          ),
        ),
        child: const MyHomePage(title: 'New',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  String _loginButtonText = "Profile";
  String _registrationbuttonText = "Registration";
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
     /* appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            CircularRevealAnimation(
              child: Image.asset('assets/desktoppicture.jpeg'),
              animation: animation,
              /*centerAlignment: Alignment.centerRight,
              centerOffset: Offset(130, 100),*/
              // Optional as per your use case
               minRadius: 0,
               maxRadius: 80,
            ),
            const SizedBox(height: 20,),

            const Text(
              'Tanisha Arora',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontFamily: 'BubblegumSans',
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),

            const Divider(
              indent: 80.0,
              endIndent: 80.0,
              color: Colors.white12,
              thickness: 1,
            ),
            const SizedBox(height: 30,),

            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(70, 0, 0, 0) ,
              title: Text('+91 7803254456'),
              leading: Icon(Icons.phone),
            ),

            const ListTile(
              contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0) ,
              title: Text('tanishaarora@gmail.com'),
              leading: Icon(Icons.mail),
            ),

            const SizedBox(height: 30,),

            TextButton(
              child: Text(
                _loginButtonText,
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
              },
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  elevation: 2,
                  backgroundColor: Colors.transparent),
            ),
            const SizedBox(height: 10,),

            TextButton(
              child: Text(
                _registrationbuttonText,
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Registration()));
              },
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  elevation: 2,
                  backgroundColor: Colors.transparent),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (animationController.status == AnimationStatus.forward ||
            animationController.status == AnimationStatus.completed) {
          animationController.reverse();
        } else {
          animationController.forward();
        }},
          child: Container(width: 60, height: 60,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors:<Color>[
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
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
                height: 65.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient( begin: Alignment.topLeft,
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
                      ],),
                  ), child: Text(
                  'Performs',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),//add futher code here
            ),
            ),
            ListTile(
              title: Text('To Do List'),
              leading: Icon(Icons.edit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Splash(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('BMI calculator'),
              leading
                  : Icon(Icons.calculate),),
          ],
        ),
      ),
    );
  }
}
