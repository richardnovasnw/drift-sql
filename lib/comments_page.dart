import 'dart:math';

import 'package:drift_sql/model/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key, required this.privateKey}) : super(key: key);
  final int privateKey;
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

final List comments = [
  'In my culture, Death is not the end',
  'I am Ironman',
  'Do you bleed',
  'With great power comes great responsibility',
  'What it is you truly desire',
  'Courage, dear heart'
];

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Comments'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () {
          final database = Provider.of<MyDatabase>(context, listen: false);

          database.addComment(Comment(
            k: widget.privateKey,
            commentss: comments[Random().nextInt(comments.length)],
          ));
        },
      ),
      body: SingleChildScrollView(
        child: _comments(context),
      ),
    );
  }

  StreamBuilder<List<Comment>> _comments(
    BuildContext context,
  ) {
    final database = Provider.of<MyDatabase>(context, listen: false);

    return StreamBuilder(
      stream: database.getComments(widget.privateKey),
      builder: (context, AsyncSnapshot<List<Comment>> snapshot) {
        final cmt = snapshot.data ?? [];

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cmt.length,
          itemBuilder: (context, index) {
            final item = cmt[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 1,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
                child: ListTile(
                  subtitle: Text('${item.k}'),
                  title: Text(item.commentss),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
