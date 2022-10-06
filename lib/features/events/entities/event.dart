import 'package:floor/floor.dart';

import '../../../core/entities/base_entity.dart';

@Entity(tableName: "event")
class Event extends BaseEntity {
  final String name;
  final double budget;
  final DateTime date;

  const Event({
    required super.id,
    required this.name,
    required this.budget,
    required this.date,
    required super.createdAt,
    required super.updateAt,
  });

  @override
  List<Object?> get props => [...super.props, id, name, budget, date];
}
