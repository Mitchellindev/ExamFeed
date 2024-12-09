class QuestionsModel {
  String? status;
  String? message;
  List<Data>? data;

  QuestionsModel({this.status, this.message, this.data});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool? bookmarked;
  String? sId;
  String? examYear;
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? optionE;
  String? correctAnswer;
  String? explanation;
  String? photo;
  String? answerPhoto;
  String? subject;
  String? examBody;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.bookmarked,
      this.sId,
      this.examYear,
      this.question,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.optionE,
      this.correctAnswer,
      this.explanation,
      this.photo,
      this.answerPhoto,
      this.subject,
      this.examBody,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    bookmarked = json['bookmarked'];
    sId = json['_id'];
    examYear = json['exam_year'];
    question = json['question'];
    optionA = json['option_a'];
    optionB = json['option_b'];
    optionC = json['option_c'];
    optionD = json['option_d'];
    optionE = json['option_e'];
    correctAnswer = json['correct_answer'];
    explanation = json['explanation'];
    photo = json['photo'];
    answerPhoto = json['answer_photo'];
    subject = json['subject'];
    examBody = json['exam_body'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookmarked'] = this.bookmarked;
    data['_id'] = this.sId;
    data['exam_year'] = this.examYear;
    data['question'] = this.question;
    data['option_a'] = this.optionA;
    data['option_b'] = this.optionB;
    data['option_c'] = this.optionC;
    data['option_d'] = this.optionD;
    data['option_e'] = this.optionE;
    data['correct_answer'] = this.correctAnswer;
    data['explanation'] = this.explanation;
    data['photo'] = this.photo;
    data['answer_photo'] = this.answerPhoto;
    data['subject'] = this.subject;
    data['exam_body'] = this.examBody;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
