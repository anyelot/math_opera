import 'package:hive/hive.dart';
part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeDataDb extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int score;

  @HiveField(2)
  String corrects;

  @HiveField(3)
  String incorrects;

  @HiveField(4)
  String email;

  @HiveField(5)
  String password;

  @HiveField(6)
  String school;

  @HiveField(7)
  String birthdate;

  @HiveField(8)
  String grade;

  SomeDataDb(
      {required this.name,
      required this.score,
      required this.corrects,
      required this.incorrects,
      required this.email,
      required this.password,
      required this.school,
      required this.birthdate,
      required this.grade});
}
