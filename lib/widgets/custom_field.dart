import 'package:chat_app/animated/custom_animate_border.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final Widget? suffix;
  late TextEditingController? textController;
  void Function(String)? onChanged;
  String Function(String)? validate;
  late bool? obscureText;

  MyTextField(
      {super.key,
      required this.label,
      required this.suffix,
      required this.textController,
      this.onChanged,
      this.validate,
      this.obscureText});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();

  late String validateText;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    final Animation<double> curve =
        CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    // controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller?.forward();
      } else {
        controller?.reverse();
      }
    });
    super.initState();
    validateText = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (controller != null) {
      controller?.dispose();
    }
    super.dispose();
  }

  void defaultOnChanged(String value) {
    if (widget.validate != null) {
      setState(() {
        validateText = widget.validate!(value);
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    //Exception
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: CustomPaint(
            painter: CustomAnimateBorder(
                alpha.value,
                validateText != ''
                    ? Colors.red
                    : Theme.of(context).colorScheme.primary),
            child: TextFormField(
              obscureText: widget.obscureText ?? false,
              onChanged: defaultOnChanged,
              controller: widget.textController,
              focusNode: focusNode,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.red, width: 2)),
                  label: Text(widget.label),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  suffixIcon: widget.suffix),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.red, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      validateText,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
