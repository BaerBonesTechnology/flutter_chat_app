import 'package:chat_app/models/chat_room/chat_room.dart';
import 'package:chat_app/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(AppUser user) async {
    await _db.collection('users').doc(user.id).set(user.toJson());
  }

  Future<AppUser?> getUser(String id) async {
    AppUser? user;
    await _db.collection('users').doc(id).get().then((snapshot) {
      if(snapshot.exists){
        user = AppUser.fromJson(snapshot.data()!);
      }
    });
    return user;
  }

  Future<void> updateUser(AppUser user) async {
    await _db.collection('users').doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String id) async {
    await _db.collection('users').doc(id).delete();
  }

  Future<void> addChat(AppUser user, ChatRoom chatRoom) async {
    chatRoom.members.add(user);
    await _db.collection('chats').doc(chatRoom.id).set(chatRoom.toJson());
  }
}