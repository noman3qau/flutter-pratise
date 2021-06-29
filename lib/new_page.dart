import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext mcontext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: new Text("New Page"),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(mcontext);
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.green,
                    child: Text(
                      "Expanded",
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.green,
                    child: Text(
                      "Expanded",
                      style: TextStyle(fontSize: 25),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Container(
                    color: Colors.yellow,
                    child: Text(
                      "Flexible",
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.green,
                    child: Text(
                      "Expanded",
                      style: TextStyle(fontSize: 25),
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Container(
                        color: Colors.yellow,
                        child: Text(
                          "Flexible",
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                  Flexible(
                      child: Container(
                        color: Colors.yellow,
                        child: Text(
                          "Flexible",
                          style: TextStyle(fontSize: 25),
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          "Expanded",
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                  Expanded(
                    flex: 3,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Expanded",
                          style: TextStyle(fontSize: 25),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
