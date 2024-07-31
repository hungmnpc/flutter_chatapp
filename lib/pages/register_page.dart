import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/models/register_entity.dart';
import 'package:chat_app/utils/constrains.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:chat_app/widgets/custom_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController fullNameController;
  late TextEditingController passwordController;
  late TextEditingController cfPasswordController;
  late Icon? suffixEmailIcon;
  late Icon? suffixFullNameIcon;
  late bool? showPassword;
  late bool? showCfPassword;
  late bool? agreePolicy;

  // ignore: unused_field, prefer_final_fields
  late RegisterEntity _registerEntity = RegisterEntity("", "", "");

  late String cfPassword = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showPassword = false;
    showCfPassword = false;
    suffixEmailIcon = null;
    suffixFullNameIcon = null;
    agreePolicy = false;
    emailController = TextEditingController();
    emailController.value = TextEditingValue(text: _registerEntity.email);
    fullNameController = TextEditingController();
    fullNameController.value = TextEditingValue(text: _registerEntity.fullName);
    passwordController = TextEditingController();
    passwordController.value = TextEditingValue(text: _registerEntity.password);
    cfPasswordController = TextEditingController();
    cfPasswordController.value = TextEditingValue(text: cfPassword);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    cfPasswordController.dispose();
  }

  String emailValidate(String email) {
    if (Constrains.emailRegex.hasMatch(email)) {
      setState(() {
        suffixEmailIcon = Constrains.validateIcon;
      });
      return '';
    } else {
      suffixEmailIcon = null;
      return 'Invalid email';
    }
  }

  String fullNameValidate(String fullname) {
    if (fullname.length < 3) {
      suffixFullNameIcon = null;
      return 'Full name must be at least 3 characters long';
    } else {
      suffixFullNameIcon = Constrains.validateIcon;
      return '';
    }
  }

  String passwordValidate(String password) {
    if (Constrains.passwordRegex.hasMatch(password)) {
      return '';
    } else {
      return 'Your password must contain at least one uppercase letter, one number, one special character, and be at least 7 characters long';
    }
  }

  String cfPasswordValidate(String cfPassword) {
    if (passwordController.text == cfPassword) {
      return '';
    } else {
      return 'Confirm password not match';
    }
  }

  bool formValidate() {
    if (fullNameValidate(fullNameController.text) != '' ||
        passwordValidate(passwordController.text) != '' ||
        emailValidate(emailController.text) != '' ||
        cfPasswordValidate(cfPasswordController.text) != '') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleAppbar: "Create Account",
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 105),
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enter information to create your account with us",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 17),
                  ),
                ),
              ),
              // Text "Enter information to create your account with us"

              // Body
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextField(
                        textController: fullNameController,
                        label: "Full Name",
                        suffix: suffixFullNameIcon,
                        validate: fullNameValidate,
                        onChanged: (value) => {
                          setState(() {
                            _registerEntity.fullName = value.trim();
                          })
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        textController: emailController,
                        label: "Email",
                        suffix: suffixEmailIcon,
                        validate: emailValidate,
                        onChanged: (value) => {
                          setState(() {
                            _registerEntity.email = value.trim();
                          })
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        obscureText: !showPassword!,
                        textController: passwordController,
                        label: "Password",
                        validate: passwordValidate,
                        onChanged: (value) => {
                          setState(() {
                            _registerEntity.password = value.trim();
                          })
                        },
                        suffix: GestureDetector(
                          onTap: () => setState(() {
                            showPassword = !showPassword!;
                          }),
                          child: Icon(showPassword!
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        obscureText: !showCfPassword!,
                        textController: cfPasswordController,
                        label: "Confirm Password",
                        validate: cfPasswordValidate,
                        onChanged: (value) => {},
                        suffix: GestureDetector(
                          onTap: () => setState(() {
                            showCfPassword = !showCfPassword!;
                          }),
                          child: Icon(showCfPassword!
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: agreePolicy,
                              onChanged: (value) {
                                setState(() {
                                  agreePolicy = !agreePolicy!;
                                });
                              },
                            ),
                            Text.rich(TextSpan(
                                text: "I agree to ",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      agreePolicy = !agreePolicy!;
                                    });
                                  },
                                children: [
                                  TextSpan(
                                      text: "User Policy ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("GO");
                                        },
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  TextSpan(text: "& "),
                                  TextSpan(
                                      text: "Term of use.",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary))
                                ]))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      MyButton(
                          onTap: () {
                            if (formValidate()) {
                              print(_registerEntity.toString());
                            } else {
                              print("not OK");
                            }
                          },
                          text: 'Create my account'),
                      SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Or continue with",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
