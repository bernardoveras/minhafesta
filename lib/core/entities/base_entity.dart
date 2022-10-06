import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

class BaseEntity extends Equatable {
  @PrimaryKey()
  final String id;
  
  final DateTime createdAt;
  final DateTime? updateAt;

  const BaseEntity({
    required this.id,
    required this.createdAt,
    required this.updateAt,
  });

  @override
  List<Object?> get props => [id, createdAt, updateAt];
}
