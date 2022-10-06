// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorDatabaseImpl {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorDatabaseImplBuilder databaseBuilder(String name) =>
      _$FloorDatabaseImplBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorDatabaseImplBuilder inMemoryDatabaseBuilder() =>
      _$FloorDatabaseImplBuilder(null);
}

class _$FloorDatabaseImplBuilder {
  _$FloorDatabaseImplBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorDatabaseImplBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorDatabaseImplBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorDatabaseImpl> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorDatabaseImpl();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorDatabaseImpl extends FloorDatabaseImpl {
  _$FloorDatabaseImpl([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EventDao? _eventDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `event` (`name` TEXT NOT NULL, `budget` REAL NOT NULL, `date` INTEGER NOT NULL, `id` TEXT NOT NULL, `createdAt` INTEGER NOT NULL, `updateAt` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EventDao get eventDao {
    return _eventDaoInstance ??= _$EventDao(database, changeListener);
  }
}

class _$EventDao extends EventDao {
  _$EventDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _eventInsertionAdapter = InsertionAdapter(
            database,
            'event',
            (Event item) => <String, Object?>{
                  'name': item.name,
                  'budget': item.budget,
                  'date': _dateTimeConverter.encode(item.date),
                  'id': item.id,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updateAt': _dateTimeNullableConverter.encode(item.updateAt)
                }),
        _eventUpdateAdapter = UpdateAdapter(
            database,
            'event',
            ['id'],
            (Event item) => <String, Object?>{
                  'name': item.name,
                  'budget': item.budget,
                  'date': _dateTimeConverter.encode(item.date),
                  'id': item.id,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updateAt': _dateTimeNullableConverter.encode(item.updateAt)
                }),
        _eventDeletionAdapter = DeletionAdapter(
            database,
            'event',
            ['id'],
            (Event item) => <String, Object?>{
                  'name': item.name,
                  'budget': item.budget,
                  'date': _dateTimeConverter.encode(item.date),
                  'id': item.id,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updateAt': _dateTimeNullableConverter.encode(item.updateAt)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Event> _eventInsertionAdapter;

  final UpdateAdapter<Event> _eventUpdateAdapter;

  final DeletionAdapter<Event> _eventDeletionAdapter;

  @override
  Future<Event?> getById(String id) async {
    return _queryAdapter.query('SELECT * FROM events WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Event(
            id: row['id'] as String,
            name: row['name'] as String,
            budget: row['budget'] as double,
            date: _dateTimeConverter.decode(row['date'] as int),
            createdAt: _dateTimeConverter.decode(row['createdAt'] as int),
            updateAt:
                _dateTimeNullableConverter.decode(row['updateAt'] as int?)),
        arguments: [id]);
  }

  @override
  Future<List<Event>> getAll(String filter) async {
    return _queryAdapter.queryList('SELECT * FROM events WHERE name like ?1',
        mapper: (Map<String, Object?> row) => Event(
            id: row['id'] as String,
            name: row['name'] as String,
            budget: row['budget'] as double,
            date: _dateTimeConverter.decode(row['date'] as int),
            createdAt: _dateTimeConverter.decode(row['createdAt'] as int),
            updateAt:
                _dateTimeNullableConverter.decode(row['updateAt'] as int?)),
        arguments: [filter]);
  }

  @override
  Future<int> insertItem(Event item) {
    return _eventInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Event item) {
    return _eventUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Event item) {
    return _eventDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _dateTimeNullableConverter = DateTimeNullableConverter();
