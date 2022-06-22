class Task {
  int id;
  String title;
  String dateTime;
  String priority;
  int status; //0 - incomplete, 1- complete

  Task({this.title, this.dateTime, this.priority, this.status}); // initialized constructor for model classes

  Task.withId({this.id, this.title, this.dateTime, this.priority, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date']  = dateTime;
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map){
    Task t =  null;
    try {
       t = Task.withId(
          id: map['id'],
          title: map['title'],
          dateTime: map['date'],
          priority: map['priority'],
          status: map['status']);

      print("Priority==${map['priority']}");
      print("New Task == ${t.toString()}");
    }
    catch(e) {
      print('Exception is ${e.toString()}');
    }
    return t;
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, dateTime: $dateTime, priority: $priority, status: $status}';
  }
}

/*To access the model class data
* Task task = Task();  // created a task instance
* task.id;
* task.title
* */
