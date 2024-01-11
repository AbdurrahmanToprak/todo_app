import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType tasktype = TaskType.note;
  TodoService todoService = TodoService();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(240, 255, 255, 255),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: deviceWidth,
                    height: deviceHeight / 10,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.dstATop),
                            image: const AssetImage(
                                "lib/assets/images/headerimage.png"),
                            fit: BoxFit.cover)),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                          iconSize: 40,
                          color: Colors.white,
                        ),
                        const Expanded(
                            child: Text(
                          "Add New Task",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Task Title")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            filled: true, fillColor: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Category"),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Text("Category Selected")),
                            );
                            setState(() {
                              tasktype = TaskType.note;
                            });
                          },
                          child:
                              Image.asset("lib/assets/images/category_1.png"),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Text("Category Selected")),
                            );
                            setState(() {
                              tasktype = TaskType.calender;
                            });
                          },
                          child:
                              Image.asset("lib/assets/images/category_2.png"),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Text("Category Selected")),
                            );
                            setState(() {
                              tasktype = TaskType.contest;
                            });
                          },
                          child:
                              Image.asset("lib/assets/images/category_3.png"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text("User Id"),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                      controller: userIdController,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white))),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text("Time"),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                      controller: timeController,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Description")),
                  SizedBox(
                    height: 300,
                    child: TextField(
                        controller: descriptionController,
                        expands: true,
                        maxLines: null,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            saveTodo();
                            Navigator.pop(context);
                          },
                          child: const Text("Save")))
                ],
              ),
            )));
  }

  void saveTodo() {
    Todo newTodo = Todo(
        id: -1,
        todo: titleController.text,
        completed: false,
        userId: int.parse(userIdController.text));
    todoService.addTodo(newTodo);
  }
}
