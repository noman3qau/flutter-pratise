import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  List<String> locationItems = [
    "Islamabad",
    "Lahore",
    "Karachi",
    "Quetta",
    "Peshawar"
  ];

  String name = "";
  String age = "0";
  String email = "";
  String password = "";
  String selectedLocation = "";
  var maritalStatus = "single";
  bool termsCheck = true;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Form Screen"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Material(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "Enter Name", hintText: "Name"),
                      keyboardType: TextInputType.text,
                      maxLength: 20,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter name";
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Enter Age", hintText: "Age"),
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter age";
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          age = value as String;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Enter Email", hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter email";
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Enter Password", hintText: "Password"),
                      keyboardType: TextInputType.visiblePassword,
                      maxLength: 15,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter password";
                        } else if (value.length < 6) {
                          return "Password should be 6 or more characters";
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    DropdownButton(
                      hint: Text("Please choose the city you live in"),
                      items: locationItems.map((location) {
                        return DropdownMenuItem(
                            child: Text(location), value: location);
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLocation = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: Text("Married"),
                            value: "married",
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: Text("Single"),
                            value: "signle",
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: termsCheck,
                      title: Text("Signup for newpaper and related articles"),
                      onChanged: (value) {
                        termsCheck = value;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          onSubmitForm(context);
                        },
                        child: Text("Register"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmitForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print("Name: " + name);
      print("Age: " + age);
      print("Email: " + email);
      print("City: " + selectedLocation);
      print("Marital Status: " + maritalStatus);
      print("Password: " + password);
      print('Terms Checked: $termsCheck');
    }
  }
}
