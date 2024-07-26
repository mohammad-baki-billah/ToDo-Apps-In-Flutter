import 'package:flutter/material.dart';
import 'package:to_do_app/Util/dialog_box.dart';
import 'package:to_do_app/Util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  //controler
  final _controller = TextEditingController();
//list of to task
  List toDoList = [
    ["make tutorial", false],
    ["todo exercise", false],
  ];

  //checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a New Task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controllar: _controller,
              onSave: saveNewTask,
              onCancle: () => Navigator.of(context).pop);
        });
  }

  void deleteTask(int intex) {
    setState(() {
      toDoList.removeAt(intex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFuntion: (contex) => deleteTask(index),
          );
        },
      ),
    );
  }
}
