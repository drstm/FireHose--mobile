// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


// import 'dart:async';
// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}
class _MyApp extends State<MyApp> {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {},
                child: const Text(
                  'Fetch Weather Conditions',
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
        )
      )
    );
  }
}