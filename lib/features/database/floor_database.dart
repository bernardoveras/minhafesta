import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:floor/floor.dart';

import '../events/entities/event.dart';
import 'app_database.dart';
import 'convertes/datetime_converter.dart';
import 'daos/event_dao.dart';

part 'floor_database.g.dart';

@TypeConverters([DateTimeConverter, DateTimeNullableConverter])
@Database(
  version: 1,
  entities: [
    Event,
  ],
)
abstract class FloorDatabaseImpl extends FloorDatabase implements IAppDatabase {
  EventDao get eventDao;
}
