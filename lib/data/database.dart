import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
// referencing the data base again
  final myBox = Hive.box('myBox');

// this function is being run if it is the first time running this app
  void createInitialData() {
    toDoList = [
      ["This is your first Task", false],
      ["Try swiping from the right to delete the task", false],
      ["Try tapping on the checkbox", false],
      ["Try tapping on the checkbox, again", true],
    ];
  }

  // loading the data from the database
  void loadData() {
    toDoList = myBox.get("TODOLIST");
  }

  // updating the database
  void updateData() {
    myBox.put("TODOLIST", toDoList);
  }
}
