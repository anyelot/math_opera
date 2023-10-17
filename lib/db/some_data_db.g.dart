// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_data_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SomeDataDb1Adapter extends TypeAdapter<SomeDataDb1> {
  @override
  final int typeId = 0;

  @override
  SomeDataDb1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SomeDataDb1(
      id: fields[1] as int,
      score: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SomeDataDb1 obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeDataDb1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
