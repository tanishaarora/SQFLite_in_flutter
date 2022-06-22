import 'package:flutter/material.dart';
import 'package:flutter_demo/to_do_list/helper/database_helper.dart';
import 'home_screen.dart';
import '../task_model/task_model.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class AddTaskScreen extends StatefulWidget{

  final Function updateTaskList;
  final Task task;

  AddTaskScreen({this.updateTaskList, this.task});
  @override
  _AddTaskScreen createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen>{

  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _priority;
  DateTime _date = DateTime.now();

  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {    // update the tasks
      _title = widget.task.title;
      _dateController.text = widget.task.dateTime;
      _priority = widget.task.priority;
    }
    else {
      _dateController.text = _dateFormatter.format(_date);
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDatePicker() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print('$_title, $_date, $_priority');

      Task task = Task(title: _title, dateTime: _dateFormatter.format(_date), priority: _priority);
      if(widget.task == null){
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
        Toast.show("New Task Added", context, duration : Toast.LENGTH_LONG, gravity : Toast.BOTTOM);
      }
      else {
        // Update the task
        task.id = widget.task.id;
        task.status = widget.task.status;
        DatabaseHelper.instance.updateTask(task);
        Toast.show("Task Updated", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      widget.updateTaskList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        leading:IconButton(
          icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black),
          onPressed: () => Navigator.pop(context)),
      title: Row(
        children: [ Text(
        widget.task == null ? 'Add Task' : 'Update Task',
        style : const TextStyle(
          color:Color(0xffac255e),
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),),],),
      centerTitle: false,
      elevation: 0),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(labelText: 'Title', labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),),
                        validator: (input) => input.trim().isEmpty ? 'Please enter a task title' : null,
                        onSaved: (input) => _title = input,
                        initialValue: _title,
                      ),),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          style: TextStyle(fontSize: 18.0),
                          onTap: _handleDatePicker,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: DropdownButtonFormField(
                          isDense: true,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconSize: 22.0,
                          iconEnabledColor: Color(0xffac255e),
                          items: _priorities.map((String priority) {
                            return DropdownMenuItem(
                              value: priority,
                              child: Text(
                                priority,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            );
                          }).toList(),
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: 'Priority',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) => _priority == true
                              ? 'Please select a priority level'
                              : null,
                          onChanged: (value) {
                            setState(() {
                              _priority = value as String;
                            });
                          },
                          value: _priority,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        color: Color(0xffac255e),
                        borderRadius: BorderRadius.circular(30.0),),
                          child: FlatButton(
                    //      style: ElevatedButton.styleFrom(
                      //    color: Color(0xffac255e)),
                              child: Text(widget.task == null ? 'Add' : 'Update', style: TextStyle(color: Colors.white)),
                              onPressed: _submit),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}