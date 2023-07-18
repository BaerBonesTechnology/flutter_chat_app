import 'package:equatable/equatable.dart';

import '../chat_room/chat_room.dart';
import '../user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


/// freezed model for message data model
/// should include json serialization
/// should include copyWith
/// should have the following methods to convert to and from json

part 'messages.g.dart';

@JsonSerializable()
class ChatMessage extends Equatable{
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

  @override
  List<Object?> get props => [
    id,
    sender,
    chatId,
    type,
    message,
    time,
    isRead,
  ];

  ChatMessage copyWith({
    String? id,
    AppUser? sender,
    ChatRoom? chatId,
    String? type,
    String? message,
    DateTime? time,
    bool? isRead,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      chatId: chatId ?? this.chatId,
      type: type ?? this.type,
      message: message ?? this.message,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
    );
  }
}