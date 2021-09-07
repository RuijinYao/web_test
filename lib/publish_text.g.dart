// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PublishTextAdapter extends TypeAdapter<PublishText> {
  @override
  final int typeId = 0;

  @override
  PublishText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PublishText(
      textId: fields[0] as int,
      key: fields[1] as String,
      publishId: fields[2] as int,
      collectionCode: fields[3] as String?,
      local: fields[4] as String?,
      templateType: fields[5] as String?,
      content: fields[6] as String?,
      timestamp: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PublishText obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.textId)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.publishId)
      ..writeByte(3)
      ..write(obj.collectionCode)
      ..writeByte(4)
      ..write(obj.local)
      ..writeByte(5)
      ..write(obj.templateType)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublishTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
