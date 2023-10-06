import 'package:hive/hive.dart';
import 'package:math_opera/db/some_data_db.dart';

class HiveData {
  const HiveData();

  Future<int> saveUser(SomeDataDb someDataDb) async{
    final Box<SomeDataDb> box = await Hive.openBox<SomeDataDb>('user');
    return box.add(someDataDb);
  }

  Future <List<SomeDataDb>>get users async{
    final Box<SomeDataDb> box = await Hive.openBox<SomeDataDb>('user');
    return box.values.toList();
  }

}