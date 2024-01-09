import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todo = ["Study Lessons", "Run 5k", "Go To Party"];
  List<String> completed = ["Game meetup", "Take out trash"];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(240, 255, 255, 255),
          body: Column(
            children: [
              //Header
              Container(
                width: deviceWidth,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: const AssetImage(
                            "lib/assets/images/headerimage.png"),
                        fit: BoxFit.cover)),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20, 2024",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Text("My Todo List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        title: todo[index],
                      );
                    },
                  )),
                ),
              ),
              //Completed Text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              //Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: completed.length,
                          itemBuilder: (context, index) {
                            return TodoItem(title: completed[index]);
                          })),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddNewTaskScreen(),
                    ));
                  },
                  child: const Text("Add New Task"))
            ],
          ),
        ),
      ),
    );
  }
}
