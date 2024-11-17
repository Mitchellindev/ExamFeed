import 'package:exam_feed/features/home/data/models/subject.dart';

class SubjectModel {
  SubjectModel({
    required this.subjects,
  });

  final List<Subject> subjects;

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjects: json["subjects"] == null
          ? []
          : List<Subject>.from(
              json["subjects"]!.map((x) => Subject.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "subjects": subjects.map((x) => x.toJson()).toList(),
      };
}
