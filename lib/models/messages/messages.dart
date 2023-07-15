import '../chat_room/chat_room.dart';
import '../user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


/// freezed model for message data model
/// should include json serialization
/// should include copyWith
/// should have the following methods to convert to and from json

part 'messages.g.dart';

@JsonSerializable()
class ChatMessage {
  String id;
  AppUser sender;
  ChatRoom chatId;
  String type;
  String message;
  DateTime time;
  bool isRead;

  ChatMessage({
    required this.id,
    required this.sender,
    required this.chatId, //will be chat room id
    required this.type,
    required this.message, //will be encrypted prior to sending to database and decrypted when retrieved from database
    required this.time,
    required this.isRead,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}