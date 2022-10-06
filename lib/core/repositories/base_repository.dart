import '../entities/base_entity.dart';

abstract class IBaseRepository<Entity extends BaseEntity> {
  Future<Entity> insert(Entity item);
  Future<Entity> update(Entity item);
  Future<bool> delete(String id);
}
