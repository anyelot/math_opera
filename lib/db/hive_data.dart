import 'package:hive/hive.dart';
import 'package:math_opera/db/some_data_db.dart'; // Importa la primera tabla
import 'package:math_opera/db/some_data_1_db.dart'; // Importa la segunda tabla

class HiveData {
  const HiveData();

  Future<int> saveUser1(SomeDataDb1 someDataDb) async {
    final Box<SomeDataDb1> box = await Hive.openBox<SomeDataDb1>('user1'); // Cambia el nombre del Box
    return box.add(someDataDb);
  }

  Future<int> saveUser2(SomeDataDb2 someDataDb) async {
    final Box<SomeDataDb2> box = await Hive.openBox<SomeDataDb2>('user2'); // Cambia el nombre del Box
    return box.add(someDataDb);
  }

  Future<List<SomeDataDb1>> get users1 async {
    final Box<SomeDataDb1> box = await Hive.openBox<SomeDataDb1>('user1'); // Cambia el nombre del Box
    return box.values.toList();
  }

  Future<List<SomeDataDb2>> get users2 async {
    final Box<SomeDataDb2> box = await Hive.openBox<SomeDataDb2>('user2'); // Cambia el nombre del Box
    return box.values.toList();
  }
}
