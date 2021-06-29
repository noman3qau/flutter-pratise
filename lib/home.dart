import 'dart:math';
import 'package:first_flutter_project/navigation/second_screen.dart';
import 'package:first_flutter_project/new_page.dart';
import 'package:first_flutter_project/sidedrawer/formscreen.dart';
import 'package:first_flutter_project/sidedrawer/learnlistview.dart';
import 'package:first_flutter_project/utilities.dart';
import 'package:flutter/material.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "/screen1": (BuildContext context) => new FirstScreen(),
        "/screen2": (BuildContext context) => new SecondScreen()
      },
      debugShowCheckedModeBanner: false,
      title: "My Frist App",
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int randomNumber = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return new Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.green,
          appBar: AppBar(
            title: Center(child: Text("First App")),
            actions: [Icon(Icons.settings)],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This app bar view  "),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext buildContext) =>
                                new TestApp()));
                      },
                      child: Icon(Icons.arrow_forward))
                ],
              ),
            ),
            elevation: 10.0,
          ),
          body: Container(
            color: Colors.grey,
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  new ElevatedButton(
                      onPressed: () {
                        randomGenerator();
                      },
                      child: new Text("Random Number")),
                  new Text(
                    'A Random from 0 to 20 is: $randomNumber',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      new Container(
                        height: 200,
                        width: 200,
                        // color: lightPurple,
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                              colors: [
                                Colors.blue,
                                Colors.yellow,
                                Colors.cyan,
                                Colors.pink
                              ],
                              stops: [
                                0.2,
                                0.4,
                                0.6,
                                0.8
                              ],
                              center: Alignment(0.1, 0.3),
                              focal: Alignment(-0.1, 0.6)),
                        ),
                        child: GestureDetector(
                          child: Text(
                            "Dummy Text here",
                            textDirection: TextDirection.ltr,
                            style:
                                TextStyle(color: darkColorPurple, fontSize: 20),
                          ),
                          onTap: () {
                            _scaffoldKey.currentState.showSnackBar(new SnackBar(
                              content: new Text("Text is pressed"),
                              duration: Duration(seconds: 10),
                            ));
                          },
                        ),
                      ),
                      new Container(
                        height: 200,
                        width: 200,
                        color: Colors.green,
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Second Screen",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, "/screen2"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: new Text("Muhammad Noman"),
                  accountEmail: new Text("noman3qau@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: new Text(
                      "MN",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                new ListTile(
                  title: new Text("Learn ListView"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext buildContext) {
                      return new LearnListView();
                    }));
                  },
                ),
                ListTile(
                  title: new Text("Learn Form"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext buildContext) {
                      return new FormScreen();
                    }));
                  },
                ),
                ListTile(
                  title: new Text("Close"),
                  trailing: Icon(Icons.close),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void randomGenerator() {
    var ran = Random();
    int ranNum = ran.nextInt(20);

    updateNumber(ranNum);
  }

  void updateNumber(int ranNum) {
    setState(() {
      randomNumber = ranNum;
    });
  }
}
