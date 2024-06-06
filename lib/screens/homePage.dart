import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/main.dart';

class HomePage extends StatefulWidget {
  final int count;
  const HomePage({super.key,required this.count});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _count = 0;
   @override
  void initState() {
    _count = widget.count;
    super.initState();
  }
  void incrementCount() async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _count++;
    });
    sharedPreferences.setInt("counter", _count);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 45, 45),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: (){
          incrementCount();
        },child: Icon(Icons.add),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times:",style: TextStyle(fontSize: 18),),
            Text(_count.toString(),style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}