import 'dart:io';
import 'package:flutter_demo/to_do_list/task_model/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _database ;

  DatabaseHelper._instance();

  String tasksTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';

  Future<Database> get db async {
    if(_database == null){
      _database = await _initDb();
    }
    return _database;
  }

  Future<Database> _initDb() async{
    Directory dir  = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    final todoListDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async{
    await db.execute('CREATE TABLE $tasksTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT, $colPriority TEXT, $colStatus INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(tasksTable);
 //   print("Latest size is ${result.length}");
    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
    print("Length is ${taskMapList.length}    ${taskMapList.toString()}");
    final List<Task> taskList = [];
    taskMapList.forEach((taskMap) {
  //    print('Single task ====${Task.fromMap(taskMap)}');
      taskList.add(Task.fromMap(taskMap));
  //    print('Task === $taskMap');

    });
    taskList.sort((taskA, taskB) => taskA.dateTime.compareTo(taskB.dateTime));
  //  print("Length issssssssss ${taskList.length}");
    return taskList;
  }

  Future<int> insertTask(Task task) async {
    Database db = await this.db;
    final int result = await db.insert(tasksTable, task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database db = await this.db;
    final int result = await db.update(
      tasksTable,
      task.toMap(),
      where: '$colId = ?',
      whereArgs: [task.id],
    );
    return result;
  }

  Future<int> deleteTask(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
        tasksTable,
        where: '$colId = ?',
        whereArgs: [id],
    );
    return result;
  }

  Future<int> deleteAllTask() async {
    Database db = await this.db;
    final int result = await db.delete(tasksTable);
    return result;
  }
}