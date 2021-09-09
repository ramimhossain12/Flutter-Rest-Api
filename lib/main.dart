import 'package:flutter/material.dart';
import 'package:rest_api/views/note_list.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: NoteList(),
  ));
}
