import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'details.g.dart';

class Details extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get name => text().withLength(min: 4, max: 32).nullable()();
  TextColumn get state => text().nullable()();
  IntColumn get age => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Comments extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get commentss => text()();

  IntColumn get k => integer()
      .nullable()
      .customConstraint('NULL REFERENCES details(id) ON DELETE CASCADE')();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Details, Comments])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //READ
  Future<List<Detail>> getAllDetails() => select(details).get();
  Stream<List<Detail>> watchAllDetails() => select(details).watch();
  Stream<List<Comment>> getComments(int key) =>
      (select(comments)..where((cmt) => cmt.k.equals(key))).watch();
  Stream<List<Comment>> getCmt() => (select(comments)).watch();

  //INSERT
  Future insert(Detail task) => into(details).insert(task);
  Future addComment(Comment cmt) => into(comments).insert(cmt);

  //DELETE
  Future deleteDetail(Detail task) => delete(details).delete(task);

  //UPDATE
  Future updateDetail(Detail task) => update(details).replace(task);

//   Future<List<Detail>> sortEntriesAlphabetically() {
//   return (select(details)..orderBy([(t) => OrderingTerm(expression: t.id)])).get();
// }
}
