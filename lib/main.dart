import 'package:flutter/material.dart';
import 'package:flutter_demo/Login.dart';
import 'Registration.dart';
import 'package:circular_reveal_animation/src/circular_reveal_animation.dart';

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
            image:  DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,)
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

  String _loginButtonText = "Login";
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
              title: Text('+91 7800324977'),
              leading: Icon(Icons.phone),
            ),

            const ListTile(
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
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
        }}
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
