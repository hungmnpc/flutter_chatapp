import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;

  String text;

  MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 200,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 17),
        )),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(5, 5),
              )
            ]),
      ),
    );
  }
}
