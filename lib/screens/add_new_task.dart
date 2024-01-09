import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
          width: deviceWidth,
          height: deviceHeight / 10,
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: const AssetImage("lib/assets/images/headerimage.png"),
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
        )
      ],
    )));
  }
}
