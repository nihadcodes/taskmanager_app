import 'package:flutter/material.dart';
import 'package:taskmanager_app/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager_app/screen/onboarding/loginScreen.dart';
import 'package:taskmanager_app/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager_app/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager_app/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager_app/screen/task/newTaskListScreen.dart';
import 'package:taskmanager_app/uitility/uitility.dart';
import 'screen/onboarding/splashScreen.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if (token != null) {
    runApp(MyApp("/login"));
  }

  else {
    runApp(MyApp("/newTaskList"));
  }
}

class MyApp extends StatelessWidget {
  final String FirstrRoute;
  MyApp(this.FirstrRoute);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Task Manager",
      initialRoute: FirstrRoute,
      routes: {
        '/': (context)=> const SplashScreen(),
        '/login': (context)=> loginScreen(),
        '/registration': (context)=> registrationScreen(),
        '/emailVerification': (context)=> emailVerificationScreen(),
        '/pinVerification': (context)=> pinVerificationScreen(),
        '/setPassword': (context)=> setPasswordScreen(),
        '/newTaskList':(context)=>newTaskListScreen(),
      },

    );
  }
}
