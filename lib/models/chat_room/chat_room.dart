import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../messages/messages.dart';
import '../user/user.dart';

part 'chat_room.g.dart';

@JsonSerializable()
class ChatRoom extends Equatable{

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

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    members,
    messages,
    lastMessageTime,
  ];
}