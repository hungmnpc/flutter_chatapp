import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;
  final String titleAppbar;
  const CustomScaffold(
      {super.key, required this.child, required this.titleAppbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          titleAppbar,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: child!,
    );
  }
}
