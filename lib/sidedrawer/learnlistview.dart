import 'package:flutter/material.dart';

class LearnListView extends StatefulWidget {
  @override
  _LearnListViewState createState() => _LearnListViewState();
}

class _LearnListViewState extends State<LearnListView> {
  List<int> listItems = [];

  @override
  void initState() {
    for (int i = 0; i < 50; i++) {
      listItems.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Learn ListView")),
          leading: new IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (BuildContext buildContext, index) {
                var color = Colors.white;
                if (index % 2 == 0) {
                  color = Colors.white;
                } else {
                  color = Colors.grey;
                }
                return Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  color: color,
                  child: ListTile(
                    title: new Text("Title: ${index}"),
                    subtitle: new Text("SubTitle: ${index}"),
                    trailing: Icon(Icons.ac_unit),
                    leading: Icon(Icons.ad_units),
                    contentPadding: EdgeInsets.only(top: 10),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
