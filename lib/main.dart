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
    // TODO: implement initState
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
        print("literally anything");
        // print(context);
        // Navigator.push(
        //   context, 
        //   MaterialPageRoute(builder: (context) => SecondRoute()),
        // );
        // print("lol wtf");
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
      home: Scaffold(
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
                  subtitle: Text('Please consider evacuating immediately!')
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                        child: const Text('ONLINE HELP'),
                        onPressed: _launchURL,
                      ),
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'wassup danger',
                style: TextStyle(fontSize: 20)
              ),
              color: Colors.orange[400],
              highlightColor: Colors.orange[100],
              padding: EdgeInsets.symmetric(
                horizontal: 18.0, 
                vertical: 10.0
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.orange[100]))
            )
          ],
        ),
      ),
    );
  }
}