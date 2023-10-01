class Session {
  Session({
    this.id,
    required this.score,
    required this.corrects,
    required this.incorrects,
  });

  int? id;
  int score;
  List<String> corrects;
  List<String> incorrects;

  int get getScore => score;

  List<String> get getCorrects => corrects;
  List<String> get getIncorrects => incorrects;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        score: json["score"] ?? "someScore",
        corrects: json["corrects"] ?? "someCorrects",
        incorrects: json["incorrects"] ?? "someincorrects",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "score": score,
        "corrects": corrects,
        "incorrects": incorrects,
      };
}

class User {
  User({
    this.id,
    required this.school,
    required this.grade,
    required this.birthdate,
    required this.email,
  });

  int? id;
  String school;
  String grade;
  String birthdate;
  String email;

  String get info => '$school $grade';

  String get emailAddress => email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        school: json["school"] ?? "someschool",
        grade: json["grade"] ?? "somegrade",
        birthdate: json["birthdate"] ?? "somebirthdate",
        email: json["email"] ?? "someemail",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "school": school,
        "grade": grade,
        "birthdate": birthdate,
        "email": email,
      };
}
