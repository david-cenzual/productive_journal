class Objective {
  Objective(
    this.id,
    this.name,
  );

  factory Objective.fromJson(Map<String, dynamic> json) {
    return Objective(
      json['id'] as int,
      json['name'] as String,
    );
  }

  final int id;
  final String name;

  Map<String, dynamic> toJson(Objective objective) {
    return <String, dynamic>{
      'id': objective.id,
      'name': objective.name,
    };
  }
}
