import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../messages/messages.dart';
import '../user/user.dart';

part 'chat_room.g.dart';

@JsonSerializable()
class ChatRoom extends Equatable{

  /* Quick note:
   * chat room search model will be 'name + id?' to allow for
   * 1. Specific chat room searching
   * 2. Chat room name flexibility
   * 3. Optional, chat room id searching for specific chat rooms
   *
   * chat room id's will be a series of 4 random numbers static and unique to each chat room
   * chat rooms can have the option of being private or public
   * private chat rooms will require an invite to join
   * public chat rooms will be open to all users
   * protected chat rooms will be searchable and require a passcode to join
   */
  final String id;
  final String name;
  final String description;
  final List<AppUser> invited;
  final List<AppUser> members;
  final List<ChatMessage> messages;
  final DateTime? lastMessageTime;
  final String publicKey;

  const ChatRoom({
    required this.id,
    required this.name,
    this.description = "",
    this.invited = const [],
    this.members = const [],
    this.messages = const [],
    this.lastMessageTime,
    this.publicKey = "",
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    invited,
    members,
    messages,
    lastMessageTime,
    publicKey,
  ];

  /// A function used to create a copy of the chat room with the updated parameters
  ChatRoom copyWith({
    String? id,
    String? name,
    String? description,
    List<AppUser>? invited,
    List<AppUser>? members,
    List<ChatMessage>? messages,
    DateTime? lastMessageTime,
    String? publicKey,
}){
    return ChatRoom(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      invited: invited ?? this.invited,
      members: members ?? this.members,
      messages: messages ?? this.messages,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      publicKey: publicKey ?? this.publicKey,
    );
}
}