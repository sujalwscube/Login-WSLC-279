import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginapp/Screens/SignUp/Blocs/signupbloc.dart';

class SignUpController{
  static SignUp(String email,String password,String username,BuildContext context){
    if(email=="" || password=="" || username==""){
      return log("Enter Required Field's");
    }
    else{
      context.read<SignUpBloc>().signUp(email, password, username);
      log("Success");
    }
  }
}