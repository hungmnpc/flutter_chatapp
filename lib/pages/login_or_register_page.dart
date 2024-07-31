// ignore_for_file: prefer_const_constructors

import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/customs/my_route_custom.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  double appBarHeight = 70;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleAppbar: "Create Account",
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 40, right: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Center(
                child: Column(
                  children: [
                    //Waving hand
                    Image.asset(
                      "assets/waving_hand.png",
                      scale: 1.2,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Hello !!
                    Text(
                      "Hello !!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Text
                    Text(
                      "You need to create your account in order to save your data on cloud.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),

                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Create Account Button
                        MyButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MyRoute(builder: (e) => RegisterPage()),
                              );
                            },
                            text: 'Create account'),

                        SizedBox(
                          height: 20,
                        ),

                        // Already Account and login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MyRoute(
                                    builder: (e) => LoginPage()!,
                                  ),
                                );
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
