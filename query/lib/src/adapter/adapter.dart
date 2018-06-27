library jaguar_orm.adapter;

import 'dart:async';
import 'package:jaguar_query/jaguar_query.dart';

/// Adapter interface that must be implemented to support new databases
abstract class Adapter<ConnType> {
  /// Makes a new connection to database
  Future<Null> connect();

  /// Closes the connection
  Future<Null> close();

  ConnType get connection;

  /// Returns a row found by executing [statement]
  Future<Map> findOne(Find statement);

  /// Returns a list of rows found by executing [statement]
  Future<Stream<Map>> find(Find statement);

  /// Executes the insert statement and returns the primary key of
  /// inserted row
  Future<dynamic> insert(Insert statement);

  /// Updates the row and returns the number of rows updated
  Future<int> update(Update statement);

  /// Deletes the requested row
  Future<int> remove(Remove statement);

  /// Creates the table
  Future<Null> createTable(Create statement);

  /// Create the database
  Future<Null> createDatabase(CreateDb statement);

  /// Drops tables from database
  Future<Null> dropTable(Drop st);

  /// Drops tables from database
  Future<Null> dropDb(DropDb st);
}

/// Used to convert [Map] to model [ModelType]
abstract class Mapper<ModelType> {
  ModelType fromMap(Map map);
}

/// Convenience class to execute `Find` statement using [adapter]
class FindExecutor<ConnType> {
  /// The adapter used to execute find statement
  final Adapter<ConnType> adapter;

  final Find _st;

  FindExecutor(this.adapter, this._st);

  /// Returns a row found by executing [statement]
  Future<Map> one() => adapter.findOne(_st);

  /// Returns a row found by executing [statement]
  Future<List<Map>> many() async => (await adapter.find(_st)).toList();

  /// Returns a row found by executing [statement]
  Future<Stream<Map>> manyStream() => adapter.find(_st);

  /// Returns a row found by executing [statement]
  Future<T> oneMapped<T>(Mapper<T> mapper) async {
    final Map map = await adapter.findOne(_st);
    return mapper.fromMap(map);
  }

  /// Returns a row found by executing [statement]
  Future<List<T>> manyMapped<T>(Mapper<T> mapper) async =>
      (await adapter.find(_st)).map(mapper.fromMap).toList();

  /// Returns a row found by executing [statement]
  Future<Stream<T>> manyMappedStream<T>(Mapper<T> mapper) async =>
      (await adapter.find(_st)).map(mapper.fromMap);
}
