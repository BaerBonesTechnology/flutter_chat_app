// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as String,
      sender: AppUser.fromJson(json['sender'] as Map<String, dynamic>),
      chatId: ChatRoom.fromJson(json['chatId'] as Map<String, dynamic>),
      type: json['type'] as String,
      message: json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'chatId': instance.chatId,
      'type': instance.type,
      'message': instance.message,
      'time': instance.time.toIso8601String(),
      'isRead': instance.isRead,
    };
