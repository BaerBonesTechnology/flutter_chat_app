// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profilePicture'] as String?,
      status: json['status'] as String?,
      lastSeen: json['lastSeen'] == null
          ? null
          : DateTime.parse(json['lastSeen'] as String),
      isOnline: json['isOnline'] as bool?,
      chats:
          (json['chats'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'status': instance.status,
      'lastSeen': instance.lastSeen?.toIso8601String(),
      'isOnline': instance.isOnline,
      'chats': instance.chats,
      'blockedUsers': instance.blockedUsers,
    };
