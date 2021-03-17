import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Another extends StatefulWidget {
  @override
  _AnotherState createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  String name = "";
  int age = 0;
  double height = 0.0;
  bool developer = false;
  List<String> skills = ["", ""];
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    deleteData();
    print("data destroyed");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Another screen"),
      ),
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 30, color: Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name : " + name),
              Text("Age : $age"),
              Text("Height : $height"),
              Text("Developer : $developer"),
              Text("Skills : 1 " + skills[0]),
              Text("Skills : 2 " + skills[1]),
              RaisedButton(
                child: Text("Get Data"),
                onPressed: () async {
                  await getData();
                },
              ),

            ],
          ),),
        ),
      
    );
  }

  deleteData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.remove("name");
    pref.remove("age");
    pref.remove("height");
    pref.remove("developer");
    pref.remove("skills");
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("name") == null ? "" : pref.getString("name");
      age = pref.getInt("age") == null ? 0 : pref.getInt("age");
      height =
          pref.getDouble("height") == null ? 0.0 : pref.getDouble("height");
      developer =
          pref.getBool("developer") == null ? false : pref.getBool("developer");
      skills = pref.getStringList("skills") == null
          ? ["", ""]
          : pref.getStringList("skills");
    });
    print("sent");
  }
}
