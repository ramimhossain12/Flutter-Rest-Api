import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rest Api'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.favorite),
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => Divider(
            height: 1,
            color: Colors.green,
          ),
          itemBuilder: (_, index) {
            return ListTile(
              title: Text('Hello',style: TextStyle(color: Theme.of(context).primaryColor),),
              subtitle: Text("Last Edited on 21/2/2021") ,
            );
            
          },
          itemCount: 30,
        ));
  }
}
