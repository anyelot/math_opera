import 'package:hive/hive.dart';
part 'some_data_1_db.g.dart';

@HiveType(typeId: 1)
class SomeDataDb2 extends HiveObject {
  
  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  @HiveField(3)
  String school;

  @HiveField(4)
  String birthdate;

  @HiveField(5)
  String grade;

  SomeDataDb2({
    this.email = '',
    this.password = '',
    this.school = '',
    this.birthdate = '',
    this.grade = '',
  });
}
