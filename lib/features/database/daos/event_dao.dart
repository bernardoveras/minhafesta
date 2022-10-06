import 'package:floor/floor.dart';

import '../../events/entities/event.dart';
import 'base_dao.dart';

@dao
abstract class EventDao extends IBaseDao<Event> {
  @Query('SELECT * FROM events WHERE id = :id')
  Future<Event?> getById(String id);

  @Query('SELECT * FROM events WHERE name like :filter')
  Future<List<Event>> getAll(String filter);
}
