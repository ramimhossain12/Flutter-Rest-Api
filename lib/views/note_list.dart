import 'package:flutter/material.dart';
import 'package:rest_api/models/note_for_listing.dart';

import 'note_delete.dart';
import 'note_modify.dart';

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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteModify(
                      noteID: '',
                    )));
          },
          child: Icon(Icons.favorite),
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => Divider(
            height: 1,
            color: Colors.green,
          ),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context, builder: (context) => NoteDelete());

                return result;
              },
              background: Container(
                color: Colors.redAccent,
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: ListTile(
                title: Text(
                  notes[index].noteTitle,
                ),
                subtitle:
                    Text('Last edited on ${notes[index].latestEditDateTime}'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          NoteModify(noteID: notes[index].noteID)));
                },
              ),
            );
          },
          itemCount: notes.length,
        ));
  }
}
