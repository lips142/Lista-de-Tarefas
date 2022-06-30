import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/widgets/taskList.dart';

class toDoListPage extends StatefulWidget {
  toDoListPage({Key? key}) : super(key: key);

  @override
  State<toDoListPage> createState() => _toDoListPageState();
}

class _toDoListPageState extends State<toDoListPage> {
  final TextEditingController taskController = TextEditingController();

  List<todo> task = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  " LISTA DE TAREFAS ",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicione um Item",
                          labelStyle: TextStyle(fontSize: 25),
                          hintText: "Adicione Uma Tarefa",
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        String text = taskController.text;
                        setState(() {
                          todo newtodo =
                              todo(title: text, dateTime: DateTime.now());
                          task.add(newtodo);
                        });

                        taskController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(12),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (todo tasks in task)
                        todoListitem(
                          task: tasks,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Voce possui ${task.length} Tarefas Pendentes",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: deleteAll,
                      child: Text(
                        "Limpar Tudo",
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(12),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteAll() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Limpar tudo?"),
              content: Text("Deseja realmente Apagar tudo? "),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      deleteAllTasks();
                    },
                    child: Text("Limpar tudo")),
              ],
            ));
  }

  void deleteAllTasks() {
    setState(() {
      task.clear();
    });
    task.clear();
  }
}
