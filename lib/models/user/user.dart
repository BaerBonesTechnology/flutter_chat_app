import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

///freezed model for user should have a factory constructor to upload the user to firebase and a fromJson method to convert the json to a user object
///the user model should have a copyWith method to update the user object
///the user has the following parameters: id, email, name, profilePicture, status, lastSeen, and isOnline
part 'user.g.dart';

@JsonSerializable()
class AppUser extends Equatable{
  final String id;
  final String? email;
  final String? name;
  final String? profilePicture;
  final String? status;
  final DateTime? lastSeen;
  final bool? isOnline;
  final List<String> chats;
  final List<String> blockedUsers;

  AppUser({
    required this.id,
    this.email,
    this.name,
    this.profilePicture,
    this.status,
    this.lastSeen,
    this.isOnline,
    this.chats = const [],
    this.blockedUsers = const [],
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    profilePicture,
    status,
    lastSeen,
    isOnline,
    chats,
    blockedUsers,
  ];
}