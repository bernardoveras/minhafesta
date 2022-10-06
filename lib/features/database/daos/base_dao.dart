import 'package:floor/floor.dart';

import '../../../core/entities/base_entity.dart';

abstract class IBaseDao<Entity extends BaseEntity> {
  @insert
  Future<int> insertItem(Entity item);

  @update
  Future<int> updateItem(Entity item);

  @delete
  Future<int> deleteItem(Entity item);
}