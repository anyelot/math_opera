// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_data_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SomeDataDbAdapter extends TypeAdapter<SomeDataDb> {
  @override
  final int typeId = 0;

  @override
  SomeDataDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SomeDataDb(
      score: fields[1] as int,
      corrects: fields[2] as int,
      incorrects: fields[3] as int,
      email: fields[4] as String,
      password: fields[5] as String,
      school: fields[6] as String,
      birthdate: fields[7] as String,
      grade: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SomeDataDb obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.corrects)
      ..writeByte(3)
      ..write(obj.incorrects)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.school)
      ..writeByte(7)
      ..write(obj.birthdate)
      ..writeByte(8)
      ..write(obj.grade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeDataDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
