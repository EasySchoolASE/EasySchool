class QuizModel {
  String? questionText;
  List<Answers>? answers;

  QuizModel({this.questionText, this.answers});

  QuizModel.fromJson(var json) {
    questionText = json['question'];
    if (json['options'] != null) {
      answers = <Answers>[];
      json['options'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = questionText;
    if (answers != null) {
      data['options'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? text;
  int? score;

  Answers({this.text, this.score});

  Answers.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['score'] = score;
    return data;
  }
}