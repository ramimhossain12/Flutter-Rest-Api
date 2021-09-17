import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

main(List<String> args) {
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postJson = [];

  void fetchPosts() async {
    try {
      final res = await get(Uri.parse(url));
      final josnData = jsonDecode(res.body) as List;

      setState(() {
        _postJson = josnData;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: ListView.builder(
          itemCount: _postJson.length,
          itemBuilder: (context, i) {
            final post = _postJson[i];
            return Text(

                "UserID: ${post["userId"]}\n Title: ${post["title"]}\n Body:${post["body"]}\n\n",

            );
          },
        ),
      ),
    );
  }
}
