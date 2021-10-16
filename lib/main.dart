import 'dart:math';

import 'package:drift_sql/comments_page.dart';
import 'package:drift_sql/model/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: const MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List name = [
  'Black Panther',
  'Ironman',
  'Batman',
  'Spiderman',
  'Lucifer Morningster',
  'Aslan'
];

final List state = [
  'Wakanda',
  'United States',
  'Gotham',
  'Queens, New York city',
  'Los Angels',
  'Narnia'
];
final List<int> age = [48, 42, 33, 21, 23, 44];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_detailList(context)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final database = Provider.of<MyDatabase>(context, listen: false);

          database.insert(Detail(
              name: name[Random().nextInt(name.length)],
              state: state[Random().nextInt(state.length)],
              age: age[Random().nextInt(age.length)]));
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<List<Detail>> _detailList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);

    return StreamBuilder(
      stream: database.watchAllDetails(),
      builder: (context, AsyncSnapshot<List<Detail>> snapshot) {
        final details = snapshot.data ?? [];

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: details.length,
          itemBuilder: (context, index) {
            final item = details[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          CommentsPage(privateKey: item.id!),
                    ),
                  );
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text('${item.id}'),
                        title: Text('${item.name}'),
                        trailing: Text('age:${item.age}'),
                        subtitle: Text('${item.state}'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                database.updateDetail(item.copyWith(
                                  name: name[Random().nextInt(name.length)],
                                ));
                              },
                              child: const Text(
                                'Name',
                                style: TextStyle(color: Colors.red),
                              )),
                          TextButton(
                              onPressed: () {
                                database.updateDetail(item.copyWith(
                                  age: age[Random().nextInt(age.length)],
                                ));
                              },
                              child: const Text(
                                'Age',
                                style: TextStyle(color: Colors.red),
                              )),
                          TextButton(
                              onPressed: () {
                                database.updateDetail(item.copyWith(
                                  state: state[Random().nextInt(state.length)],
                                ));
                              },
                              child: const Text(
                                'Country',
                                style: TextStyle(color: Colors.red),
                              )),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    database.deleteDetail(item);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
