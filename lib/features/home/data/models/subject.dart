class Subject {
  Subject({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.shortTitle,
    required this.description,
    required this.slug,
    required this.examBody,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? subjectId;
  final String? title;
  final String? shortTitle;
  final String? description;
  final String? slug;
  final List<String> examBody;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json["_id"],
      subjectId: json["id"],
      title: json["title"],
      shortTitle: json["short_title"],
      description: json["description"],
      slug: json["slug"],
      examBody: json["exam_body"] == null
          ? []
          : List<String>.from(json["exam_body"]!.map((x) => x)),
      v: json["__v"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": subjectId,
        "title": title,
        "short_title": shortTitle,
        "description": description,
        "slug": slug,
        "exam_body": examBody.map((x) => x).toList(),
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
