import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeclone/awal.dart';
import 'package:get/get.dart';
import 'package:youtubeclone/main.dart';

String username="";
String password="";

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  Future cont(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    Fluttertoast.showToast(
        msg: "Continue Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0

    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),),);
  }


  @override
  void initState() {
    getNama().whenComplete(
            () async => Get.to(username == null ? Login() : Dashboard()));
    super.initState();
    getNIM().whenComplete(
            () async => Get.to(password == null ? Login() : Dashboard()));
    super.initState();
  }

  Future getNama() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainedNama = sharedPreferences.getString('nama');
    setState(() {
      username = obtainedNama;
    });
    print(username);
  }

  Future getNIM() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainedNIM = sharedPreferences.getString('NIM');
    setState(() {
      password = obtainedNIM;
    });
    print(password);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Hallo",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),

          Center(child: username == '' ? Text('') : Text(username)),
          Center(child: password == '' ? Text('') : Text(password)),
          SizedBox(height: 20,),
          MaterialButton(
            color: Colors.purple,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),),);
            },
            child: Text("Continue", style: TextStyle(color: Colors.white),),),
        ],

      ),
    );
  }


}
