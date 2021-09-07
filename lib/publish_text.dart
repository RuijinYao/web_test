import 'package:hive/hive.dart';

part 'publish_text.g.dart';

@HiveType(typeId: 0)
class PublishText {
  PublishText(
      {required this.textId,
      required this.key,
      required this.publishId,
      this.collectionCode,
      this.local,
      this.templateType,
      this.content,
      this.timestamp});

  @HiveField(0)
  int textId;

  @HiveField(1)
  String key;

  @HiveField(2)
  int publishId;

  @HiveField(3)
  String? collectionCode;

  @HiveField(4)
  String? local;

  @HiveField(5)
  String? templateType;

  @HiveField(6)
  String? content;

  @HiveField(7)
  int? timestamp;

  @override
  String toString() {
    return 'PublishText{textId: $textId, key: $key, publishId: $publishId, collectionCode: $collectionCode, local: $local, templateType: $templateType, content: $content, timestamp: $timestamp}';
  }
}
