import 'package:equatable/equatable.dart';

class Guid extends Equatable {
  final String value;

  //TODO: Criar validação do value no construtor para ser somente uuid.
  const Guid(this.value);

  @override
  String toString() {
    return value;
  }

  @override
  List<Object> get props => [value];
}
