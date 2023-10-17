import 'package:hive/hive.dart';
part 'some_data_db.g.dart';

@HiveType(typeId: 0)
class SomeDataDb1 extends HiveObject {
  
  @HiveField(1)
  int id;

  @HiveField(2)
  int score;

  SomeDataDb1({
    this.id = 0,
    this.score = 0,

  });
}