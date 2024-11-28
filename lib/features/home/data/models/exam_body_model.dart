import 'package:exam_feed/features/home/data/models/exam_body.dart';

class ExamBodyModel {
  ExamBodyModel({
    required this.examBody,
  });

  final List<ExamBody> examBody;

  factory ExamBodyModel.fromJson(Map<String, dynamic> json) {
    return ExamBodyModel(
      examBody: json["examBody"] == null
          ? []
          : List<ExamBody>.from(
              json["examBody"]!.map((x) => ExamBody.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "examBody": examBody.map((x) => x.toJson()).toList(),
      };
}
