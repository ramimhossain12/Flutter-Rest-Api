import 'package:flutter/material.dart';
import 'package:rest_api/models/note_for_listing.dart';

final notes = [
      new NoteForListing("1", "Note-1", DateTime.now(), DateTime.now()),
      new NoteForListing("2", "Note-2", DateTime.now(), DateTime.now()),
      new NoteForListing("3", "Note-3", DateTime.now(), DateTime.now()),
];
class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rest Api'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.favorite),
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => Divider(
            height: 1,
            color: Colors.green,
          ),
          itemBuilder: (_, index) {
            return ListTile(

              title: Text(
                notes[index].noteTitle,
              ),
              subtitle: Text('Last edited on ${notes[index].latestEditDateTime}') ,
            );
          },
          itemCount: notes.length,
        ));
  }
}
