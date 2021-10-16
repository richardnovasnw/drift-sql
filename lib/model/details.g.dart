// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Detail extends DataClass implements Insertable<Detail> {
  final int? id;
  final String? name;
  final String? state;
  final int? age;
  Detail({this.id, this.name, this.state, this.age});
  factory Detail.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Detail(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']),
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String?>(state);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int?>(age);
    }
    return map;
  }

  DetailsCompanion toCompanion(bool nullToAbsent) {
    return DetailsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
    );
  }

  factory Detail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Detail(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      state: serializer.fromJson<String?>(json['state']),
      age: serializer.fromJson<int?>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'state': serializer.toJson<String?>(state),
      'age': serializer.toJson<int?>(age),
    };
  }

  Detail copyWith({int? id, String? name, String? state, int? age}) => Detail(
        id: id ?? this.id,
        name: name ?? this.name,
        state: state ?? this.state,
        age: age ?? this.age,
      );
  @override
  String toString() {
    return (StringBuffer('Detail(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('state: $state, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, state, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Detail &&
          other.id == this.id &&
          other.name == this.name &&
          other.state == this.state &&
          other.age == this.age);
}

class DetailsCompanion extends UpdateCompanion<Detail> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> state;
  final Value<int?> age;
  const DetailsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.state = const Value.absent(),
    this.age = const Value.absent(),
  });
  DetailsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.state = const Value.absent(),
    this.age = const Value.absent(),
  });
  static Insertable<Detail> custom({
    Expression<int?>? id,
    Expression<String?>? name,
    Expression<String?>? state,
    Expression<int?>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state,
      if (age != null) 'age': age,
    });
  }

  DetailsCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? state,
      Value<int?>? age}) {
    return DetailsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (state.present) {
      map['state'] = Variable<String?>(state.value);
    }
    if (age.present) {
      map['age'] = Variable<int?>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('state: $state, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $DetailsTable extends Details with TableInfo<$DetailsTable, Detail> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DetailsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: false);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, state, age];
  @override
  String get aliasedName => _alias ?? 'details';
  @override
  String get actualTableName => 'details';
  @override
  VerificationContext validateIntegrity(Insertable<Detail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Detail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Detail.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DetailsTable createAlias(String alias) {
    return $DetailsTable(_db, alias);
  }
}

class Comment extends DataClass implements Insertable<Comment> {
  final int? id;
  final String commentss;
  final int? k;
  Comment({this.id, required this.commentss, this.k});
  factory Comment.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Comment(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      commentss: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}commentss'])!,
      k: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}k']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['commentss'] = Variable<String>(commentss);
    if (!nullToAbsent || k != null) {
      map['k'] = Variable<int?>(k);
    }
    return map;
  }

  CommentsCompanion toCompanion(bool nullToAbsent) {
    return CommentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      commentss: Value(commentss),
      k: k == null && nullToAbsent ? const Value.absent() : Value(k),
    );
  }

  factory Comment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comment(
      id: serializer.fromJson<int?>(json['id']),
      commentss: serializer.fromJson<String>(json['commentss']),
      k: serializer.fromJson<int?>(json['k']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'commentss': serializer.toJson<String>(commentss),
      'k': serializer.toJson<int?>(k),
    };
  }

  Comment copyWith({int? id, String? commentss, int? k}) => Comment(
        id: id ?? this.id,
        commentss: commentss ?? this.commentss,
        k: k ?? this.k,
      );
  @override
  String toString() {
    return (StringBuffer('Comment(')
          ..write('id: $id, ')
          ..write('commentss: $commentss, ')
          ..write('k: $k')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, commentss, k);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          other.id == this.id &&
          other.commentss == this.commentss &&
          other.k == this.k);
}

class CommentsCompanion extends UpdateCompanion<Comment> {
  final Value<int?> id;
  final Value<String> commentss;
  final Value<int?> k;
  const CommentsCompanion({
    this.id = const Value.absent(),
    this.commentss = const Value.absent(),
    this.k = const Value.absent(),
  });
  CommentsCompanion.insert({
    this.id = const Value.absent(),
    required String commentss,
    this.k = const Value.absent(),
  }) : commentss = Value(commentss);
  static Insertable<Comment> custom({
    Expression<int?>? id,
    Expression<String>? commentss,
    Expression<int?>? k,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (commentss != null) 'commentss': commentss,
      if (k != null) 'k': k,
    });
  }

  CommentsCompanion copyWith(
      {Value<int?>? id, Value<String>? commentss, Value<int?>? k}) {
    return CommentsCompanion(
      id: id ?? this.id,
      commentss: commentss ?? this.commentss,
      k: k ?? this.k,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (commentss.present) {
      map['commentss'] = Variable<String>(commentss.value);
    }
    if (k.present) {
      map['k'] = Variable<int?>(k.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentsCompanion(')
          ..write('id: $id, ')
          ..write('commentss: $commentss, ')
          ..write('k: $k')
          ..write(')'))
        .toString();
  }
}

class $CommentsTable extends Comments with TableInfo<$CommentsTable, Comment> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CommentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _commentssMeta = const VerificationMeta('commentss');
  late final GeneratedColumn<String?> commentss = GeneratedColumn<String?>(
      'commentss', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _kMeta = const VerificationMeta('k');
  late final GeneratedColumn<int?> k = GeneratedColumn<int?>(
      'k', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints:
          'NULL REFERENCES details(primaryKey) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [id, commentss, k];
  @override
  String get aliasedName => _alias ?? 'comments';
  @override
  String get actualTableName => 'comments';
  @override
  VerificationContext validateIntegrity(Insertable<Comment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('commentss')) {
      context.handle(_commentssMeta,
          commentss.isAcceptableOrUnknown(data['commentss']!, _commentssMeta));
    } else if (isInserting) {
      context.missing(_commentssMeta);
    }
    if (data.containsKey('k')) {
      context.handle(_kMeta, k.isAcceptableOrUnknown(data['k']!, _kMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Comment.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CommentsTable createAlias(String alias) {
    return $CommentsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DetailsTable details = $DetailsTable(this);
  late final $CommentsTable comments = $CommentsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [details, comments];
}
