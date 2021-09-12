import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteID;

  bool get isEditing => noteID != null;

  NoteModify({required this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit note' : 'Create note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            Container(
              height: 9,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            Container(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 34,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (isEditing) {
                  } else {}
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
