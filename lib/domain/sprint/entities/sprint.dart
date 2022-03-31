import 'package:equatable/equatable.dart';
import 'package:productivejournal/domain/sprint/entities/objectives.dart';

class Sprint extends Equatable {
  const Sprint({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.objectives,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) {
    return Sprint(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      objectives: json['objectives'] as List<Objective>,
    );
  }

  final int id;
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final List<Objective> objectives;

  Map<String, dynamic> toJson(Sprint sprint) {
    return <String, dynamic>{
      'id': sprint.id,
      'name': sprint.name,
      'description': sprint.description,
      'startDate': sprint.startDate,
      'endDate': sprint.endDate,
      'objectives': sprint.objectives,
    };
  }

  @override
  List<Object> get props =>
      [id, name, description, startDate, endDate, objectives];
}
