import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  Todolist(
      {super.key,
      required this.taskname,
      required this.taskstate,
      required this.onchangeit,
      required this.delete});

  final String taskname;
  final bool taskstate;
  final Function(bool?)? onchangeit;
  final Function(BuildContext)? delete;

  Color primarycolor = const Color(0xFFff9f1c);
  Color secondarycolor = const Color(0XFFffbf69);
  Color boxcolor = const Color(0XFFf6ae2d);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: delete,
            icon: Icons.delete,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(20)),
            backgroundColor: Colors.red.shade200,
            autoClose: true,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Row(
            children: [
              Checkbox(
                value: taskstate,
                onChanged: onchangeit,
                shape: const CircleBorder(),
                checkColor: Colors.white,
                activeColor: secondarycolor,
                side: const BorderSide(color: Colors.white),
              ),
              Text(
                taskname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: taskstate == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2.56,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
