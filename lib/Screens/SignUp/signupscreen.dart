import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginapp/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:loginapp/Screens/SignUp/Blocs/signupstates.dart';
import 'package:loginapp/Screens/SignUp/Controllers/signupcontroller.dart';
import 'package:loginapp/Widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SignUpBloc, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpLoadedStates) {
              log(state.signUpModel.message.toString());
            } else if (state is SignUpErrorStates) {
              log(state.errormsg.toString());
            }
          },
          builder: (context, state) {
            if (state is SignUpLoadingStates) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 70),
                  const Text(
                    " Create an account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black87.withOpacity(2.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 60,
                      width: 350,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(25),
                      //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                      // ),
                      child: UiHelper.CustomTextField(
                          usernameController, "Name", Icons.person)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    height: 60,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(25),
                    //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                    // ),
                    child: UiHelper.CustomTextField(
                        emailController, "Email", Icons.email),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    height: 60,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(25),
                    //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                    // ),
                    child: UiHelper.CustomTextField(
                        passwordController, "Password", Icons.lock),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          SignUpController.SignUp(
                              emailController.text.toString(),
                              passwordController.text.toString(),
                              usernameController.text.toString(),
                              context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        child: const Text(
                          "Register Your Self",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white),
                        )),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
