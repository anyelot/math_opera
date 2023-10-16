class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.password,
    this.birthday,
    this.grade,
    this.school,
    this.score,
  });

  int? id;
  String? firstName;
  String? lastName;
  String email;
  String password;
  String? birthday;
  String? grade;
  String? school;
  int? score;

  String get name => '$firstName $lastName';

  String get emailAddress => email;
  String? get getbirthday => birthday;
  String? get getgrade => grade;
  String? get getschool => school;
  int? get getscore => score;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        password: json["password"] ?? "somepassword",
        birthday: json["birthday"] ?? "somebirthday",
        grade: json["grade"] ?? "somegrade",
        school: json["school"] ?? "someschool",
        score: json["score"] ?? 100000,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "birthday": birthday,
        "grade": grade,
        "school": school,
        "score": score,
      };
}
