import 'package:loginapp/Screens/SignUp/Models/signupmodel.dart';

abstract class SignUpStates{}
class SignUpInitialStates extends SignUpStates{}
class SignUpLoadingStates extends SignUpStates{}
class SignUpLoadedStates extends SignUpStates{
  SignUpModel signUpModel;
  SignUpLoadedStates({required this.signUpModel});
}
class SignUpErrorStates extends SignUpStates{
  String errormsg;
  SignUpErrorStates({required this.errormsg});
}