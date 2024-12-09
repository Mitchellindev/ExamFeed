class ExamBodyQuestionsModel {
  String? sId;
  String? name;
  String? description;
  List<Subjects>? subjects;
  int? iV;

  ExamBodyQuestionsModel(
      {this.sId, this.name, this.description, this.subjects, this.iV});

  ExamBodyQuestionsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Subjects {
  String? sId;
  String? id;
  String? title;
  String? shortTitle;
  String? description;
  String? slug;
  List<String>? examBody;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Subjects(
      {this.sId,
      this.id,
      this.title,
      this.shortTitle,
      this.description,
      this.slug,
      this.examBody,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Subjects.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    shortTitle = json['short_title'];
    description = json['description'];
    slug = json['slug'];
    examBody = json['exam_body'].cast<String>();
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_title'] = this.shortTitle;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['exam_body'] = this.examBody;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
