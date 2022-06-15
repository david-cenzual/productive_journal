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
      startDate: json['start_date'] as DateTime,
      endDate: json['end_date'] as DateTime,
      objectives: json['objectives'] as List<Objective>,
    );
  }

  final int? id;
  final String? name;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Objective>? objectives;

  Map<String, Object?> toJson(Sprint sprint) {
    return <String, Object?>{
      'id': sprint.id,
      'name': sprint.name,
      'description': sprint.description,
      'startDate': sprint.startDate,
      'endDate': sprint.endDate,
      'objectives': sprint.objectives,
    };
  }

  @override
  List<Object?> get props =>
      [id, name, description, startDate, endDate, objectives];
}
