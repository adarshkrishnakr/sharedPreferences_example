import 'package:flutter/material.dart';
import 'package:shared_preferences_example/screens/splash.dart';


const SAVE_KEY_NAME = "UserLoggedIn";


 main() async{
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ScreenSplash()
    );
  }
}
