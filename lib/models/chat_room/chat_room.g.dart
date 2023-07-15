// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => ChatRoom(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => AppUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessageTime: DateTime.parse(json['lastMessageTime'] as String),
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'members': instance.members,
      'messages': instance.messages,
      'lastMessageTime': instance.lastMessageTime.toIso8601String(),
    };
