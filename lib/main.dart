// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


// import 'dart:async';
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}
class _MyApp extends State<MyApp> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    firebaseMessaging.getToken().then((token){
      print(token);
    });
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {
        print("entered onLaunch");
      },
      onMessage: (Map<String, dynamic> message) async {
        print("entered onMessage");
      },
      onResume: (Map<String, dynamic> message) async {
        print("entered onResume");
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🔥 Alert',
      theme: ThemeData(
        primaryColor: Colors.orange[700],
      ),
      home: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('🔥 Alert'),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.priority_high),
                title: Text('WARNING: You are in a high risk area for a forest fire!', style: TextStyle(color: Colors.red)),
                subtitle: Text('Please read our community driven guidelines for how to best protect yourself')
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      child: const Text('IMMEDIATE ACTIONS'),
                      onPressed: () {
                        navigateToSubPage(context);
                      },
                    ),
                    // FlatButton(
                    //   child: const Text('ONLINE HELP'),
                    //   onPressed: _launchURL,
                    // ),
                    FlatButton(
                      child: const Text('REPORT ACTIVITY'),
                      onPressed: () { /* ... */ },
                    )
                  ]
                ),
              )
            ]
          ),
        )
      )
    );
  }
}

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

// item generator
List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

List<Item> instructionSet = [
  Item(headerValue: 'What does high risk mean?', expandedValue: 'The weather conditions are optimal for a fast-growing wildfire to appear; burning activities should be restricted.'),
  Item(headerValue: 'What do I need to do?', expandedValue: 'Increase your alertness, look out for wildfire signals; Be ready to REPORT through the App or call 911 if you notice unattended or out-of-control fire.'),
  Item(headerValue: 'Should I evacuate my house?', expandedValue: 'Please wait for further instructions from the police')
];

// widget that will hold list items
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

// state for list item holder
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = instructionSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('🔥 Alert'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: _buildPanel(),
          ),
        )
      )
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyStatefulWidget()));
}