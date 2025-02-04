import 'package:flutter/material.dart';
import 'package:taskmanager_app/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager_app/screen/onboarding/loginScreen.dart';
import 'package:taskmanager_app/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager_app/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager_app/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager_app/screen/task/homeScreen.dart';
import 'package:taskmanager_app/uitility/uitility.dart';
import 'screen/task/taskCreateScreen.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp( MyApp("/login"));
  }
  else{
    runApp( MyApp("/"));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: FirstRoute,
      routes: {
        '/':(context)=> homeScreen(),
        '/login':(context)=> loginScreen(),
        '/registration':(context)=> registrationScreen(),
        '/emailVerification':(context)=> emailVerificationScreen(),
        '/pinVerification':(context)=> pinVerificationScreen(),
        '/setPassword':(context)=> setPasswordScreen(),
        '/taskCreate':(context)=> taskCreateScreen()
      },
    );
  }
}