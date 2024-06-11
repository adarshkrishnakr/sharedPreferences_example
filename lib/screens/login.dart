import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/main.dart';
import 'package:shared_preferences_example/screens/homePage.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "User Name"),
              validator: (value) {
                // if(_isDataMatched){
                //   return null;
                // }else{
                //   return "Error";
                // }
                if (value == null || value.isEmpty) {
                  return 'value is empty';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
              validator: (value) {
                // if(_isDataMatched){
                //   return null;
                // }else{
                //   return "Error";
                // }
                if (value == null || value.isEmpty) {
                  return 'value is empty';
                } else {
                  return null;
                }
              },
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                    visible: !_isDataMatched,
                    child: Text(
                      'Username password doesnot match',
                      style: TextStyle(color: Colors.red),
                    )),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print("Data empty");
                      }

                      //checkLogin(context);
                    },
                    icon: Icon(Icons.check),
                    label: Text("Login")),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void checkLogin(BuildContext context) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    _usernameController.clear();
    _passwordController.clear();
    if (_username == _password) {
      print("username password match");
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenHome()));
    } else {
      print("username password doesnot match");
    }
  }
}
