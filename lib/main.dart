import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/screens/homePage.dart';


late SharedPreferences sharedPreferences;

 main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final count = sharedPreferences.getInt("counter") ?? 0;
  runApp(MyApp(count:count));
}

class MyApp extends StatelessWidget {
  final int count;
  const MyApp({super.key,required this.count});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(count: count,),
    );
  }
}
