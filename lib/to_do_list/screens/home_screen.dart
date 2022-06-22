import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/to_do_list/screens/add_task_screen.dart';
import 'package:flutter_demo/to_do_list/task_model/task_model.dart';
import 'package:toast/toast.dart';
import '../helper/database_helper.dart';
import 'package:intl/intl.dart';

import 'settings_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  Future<List<Task>> _taskList;
  @override

  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList()  {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
      print(_taskList.toString());
    });
  }

  Future<bool> onBackPressed()  {
    return SystemNavigator.pop();
  }

  Widget _buildTask(Task task) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          if (task.status == 0)
            ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  fontSize: 18.0,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              subtitle: Text(
              task.dateTime,
                /*'${_dateFormatter.format(task.dateTime)} • ${task.priority}',*/
                style: TextStyle(
                  fontSize: 15.0,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              trailing: Checkbox(
                onChanged: (value) {
                  task.status = value ? 1 : 0;
                  DatabaseHelper.instance.updateTask(task);
                  Toast.show("Task Completed", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  _updateTaskList();
                },
                activeColor: Theme.of(context).primaryColor,
                value: task.status == 1 ? true : false,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddTaskScreen(
                    updateTaskList: _updateTaskList,
                    task: task,
                  ),
                ),
              ),
            ),
          //Divider(),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onBackPressed,
    child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffac255e),
        foregroundColor: Colors.white,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddTaskScreen(
                  updateTaskList: _updateTaskList))),
          child: Icon(Icons.add_outlined)),

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        leading: IconButton(
          icon: Icon(
              Icons.grid_view_outlined,
          color: Colors.black,),
        onPressed : null),
        title:
        Row(
          children: [
            Text(
              "Task",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: -1.2,
              ),
            ),
            Text(
              "Manager",
              style: const TextStyle(
                color: Color(0xffac255e),
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(onPressed: (){},
            icon: Icon(Icons.history_outlined),
            color: Colors.black,
            tooltip: 'View History',),

          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Settings())),
              icon: Icon(Icons.settings_outlined,),
            color: Colors.black,
          tooltip: 'Settings',)
        ],
      elevation: 0,),

      body: FutureBuilder(future: _taskList,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final int completedTaskCount = snapshot.data.where((Task task) => task.status == 0).toList().length;

        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          itemCount: 1 + snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin:
                      const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(240, 240, 240, 1.0),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          'You have [ $completedTaskCount ] pending task out of [ ${snapshot.data.length} ]',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return _buildTask(snapshot.data[index - 1]);
            },
        );
      })));
  }
}