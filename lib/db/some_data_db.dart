import 'package:hive/hive.dart';
part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeDataDb1 extends HiveObject {
  
  @HiveField(1)
  int score;

  @HiveField(2)
  int corrects;

  @HiveField(3)
  int incorrects;

  SomeDataDb1({
    this.score = 0,
    this.corrects = 0,
    this.incorrects = 0,
  });
}