// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiobook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioBookAdapter extends TypeAdapter<AudioBook> {
  @override
  final int typeId = 0;

  @override
  AudioBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioBook(
      title: fields[0] as String,
      author: fields[1] as String,
      coverUrl: fields[2] as String,
      audioUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AudioBook obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.coverUrl)
      ..writeByte(3)
      ..write(obj.audioUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
