import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/screens/login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      actions: [
        IconButton(onPressed: (){
          signout(context);
        }, icon: Icon(Icons.logout)),
      ],
      backgroundColor: Colors.green,
      ),
      body: SafeArea(child: Center(child: Text("Home"))),
    );
  }
  signout(BuildContext context) async{
    final _sharedPrefs = await SharedPreferences.getInstance();
     await _sharedPrefs.clear();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ScreenLogin()), (route) => false);
  }
}