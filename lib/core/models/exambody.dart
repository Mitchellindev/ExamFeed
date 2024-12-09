class ExamBodyModel {
  List<ExamBody>? examBody;

  ExamBodyModel({this.examBody});

  ExamBodyModel.fromJson(Map<String, dynamic> json) {
    if (json['examBody'] != null) {
      examBody = <ExamBody>[];
      json['examBody'].forEach((v) {
        examBody!.add(new ExamBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.examBody != null) {
      data['examBody'] = this.examBody!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExamBody {
  String? sId;
  String? name;
  String? description;
  int? iV;

  ExamBody({this.sId, this.name, this.description, this.iV});

  ExamBody.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}
