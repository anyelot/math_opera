// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_data_1_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SomeDataDb2Adapter extends TypeAdapter<SomeDataDb2> {
  @override
  final int typeId = 1;

  @override
  SomeDataDb2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SomeDataDb2(
      email: fields[1] as String,
      password: fields[2] as String,
      school: fields[3] as String,
      birthdate: fields[4] as String,
      grade: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SomeDataDb2 obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.school)
      ..writeByte(4)
      ..write(obj.birthdate)
      ..writeByte(5)
      ..write(obj.grade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeDataDb2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
