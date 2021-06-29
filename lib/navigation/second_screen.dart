import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (mcontext){
          return Scaffold(
            appBar: AppBar(
              title: Text("Second Screen"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: WillPopScope(
              onWillPop: () {
                showAlertDialog(context);
              },
              child: Container(
                child: Center(
                  child: Text("Second Screen"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: new Text("Clossing Screen"),
              content: new Text("Are you sure you want to close this?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print('Ok');
                    },
                    child: Text("Yes")),
              ],
            ));
  }
}
