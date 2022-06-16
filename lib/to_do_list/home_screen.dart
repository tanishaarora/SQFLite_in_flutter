import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Future<void> onBackPressed() async {
    return SystemNavigator.pop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xffac255e), onPressed: () {},
        child: Icon(Icons.add_outlined),
//    onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_) => AddTaskScreen(updateTaskList: _updateTaskList,
      ),
    );
    //),
    // ),));
  }
}