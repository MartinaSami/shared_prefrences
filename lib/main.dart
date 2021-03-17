import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'another.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shared Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: (Text("Go  to  another Screen")),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Another()));
          },
        ),
      ),
    );
  }
  setData () async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", "Ali ");
    pref.setInt("age", 20 );
    pref.setDouble("height", 160 );
    pref.setBool("developer", true);
    pref.setStringList("skills", ["Dart","Flutter"]);

  }
}
