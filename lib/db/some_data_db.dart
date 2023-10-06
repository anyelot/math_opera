import 'package:hive/hive.dart';
part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeDataDb extends HiveObject {
  

  @HiveField(1)
  int score;

  @HiveField(2)
  int corrects;

  @HiveField(3)
  int incorrects;

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
      {
       this.score=0,
       this.corrects=0,
       this.incorrects=0,
       this.email='',
       this.password='',
       this.school='',
       this.birthdate='',
       this.grade=''});
}
