import 'package:freezed_annotation/freezed_annotation.dart';

import '../messages/messages.dart';
import '../user/user.dart';

part 'chat_room.g.dart';

@JsonSerializable()
class ChatRoom {

  String id;
  String name;
  String description;
  List<AppUser> members;
  List<ChatMessage> messages;
  DateTime lastMessageTime;

  ChatRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.messages,
    required this.lastMessageTime,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
}