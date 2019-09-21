// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(MyApp(post: fetchPost()));
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
// class MyApp extends StatelessWidget {
//   final Future<Post> post;
//   MyApp({Key key, this.post}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '🔥 Alert',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('🔥 Alert'),
//         ),
//         body: Center(
//           child: FutureBuilder<Post>(
//             future: post,
//             builder: (context, snapshot){
//               print("entered");
//               print("snapshot is $snapshot");
//               if (snapshot.hasData){
//                 return Text(snapshot.data.title);
//               } else if (snapshot.hasError){
//                 return Text("${snapshot.error}");
//               }
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       )
//     );
//   }
// }

// class Post {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;

//   Post({this.userId, this.id, this.title, this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

// Future<Post> fetchPost() async {
//   final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
//   if (response.statusCode == 200){
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     throw Exception("Failed to fetch data");
//   }
// }

