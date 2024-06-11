import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/main.dart';
import 'package:shared_preferences_example/screens/homePage.dart';
import 'package:shared_preferences_example/screens/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
     checkUserLoggedIn();
    super.initState();
   
  }

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading......"),
            Icon(Icons.donut_large_rounded)
          ],
        )
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenLogin()),
      );
    
  }
  Future<void> checkUserLoggedIn() async{
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggenIn= _sharedPrefs.getBool(SAVE_KEY_NAME);
    if(_userLoggenIn == null || _userLoggenIn == false){
      gotoLogin();
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ScreenHome()));
    }
  }
}
