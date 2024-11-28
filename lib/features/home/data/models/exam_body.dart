class ExamBody {
  ExamBody({
    required this.id,
    required this.name,
    required this.description,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? description;
  final int? v;

  factory ExamBody.fromJson(Map<String, dynamic> json) {
    return ExamBody(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "__v": v,
      };
}
