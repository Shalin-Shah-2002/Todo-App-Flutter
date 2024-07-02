import 'package:flutter/material.dart';
import 'package:todo/screens/add.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var textcontroller = TextEditingController();

  Color primarycolor = const Color(0xFFff9f1c);

  Color secondarycolor = const Color(0XFFffbf69);

  Color boxcolor = const Color(0XFFf6ae2d);

  List todolist = [
    ['GO For Walk', false],
    ['Drink Coffee', true],
  ];
  void deletetask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  void savedtask() {
    setState(() {
      todolist.add([textcontroller.text, false]);
      textcontroller.clear();
    });
  }

  void checkboxchangeit(index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: primarycolor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: secondarycolor,
      body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (BuildContext context, index) {
            return Todolist(
              taskname: todolist[index][0],
              taskstate: todolist[index][1],
              onchangeit: (value) => checkboxchangeit(index),
              delete: (context) => deletetask(index),
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: TextField(
              controller: textcontroller,
              decoration: InputDecoration(
                  hintText: 'Add More Todo Items',
                  filled: true,
                  fillColor: Colors.orange.shade200,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white))),
            ),
          )),
          FloatingActionButton(
            shape: const CircleBorder(),
            elevation: 20,
            backgroundColor: primarycolor,
            foregroundColor: Colors.white,
            onPressed: savedtask,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
