import 'package:chat_app/models/chat_room/chat_room.dart';
import 'package:chat_app/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/messages/messages.dart';

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

  Future<void> notifyChat(ChatRoom chatRoom, List<AppUser> users) async {

  }

  Future<void> addMessage(ChatRoom chatRoom, ChatMessage message) async {
    try {
      // check if user has permissions to add message
      // encrypt message
      // add message to database
      await _db.collection('chatrooms').doc(chatRoom.id)
          .collection('messages')
          .add(message.toJson())
          .then((value) =>
      {
        notifyChat(chatRoom, chatRoom.members)
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString()); // TODO: Add further error checking
        // TODO: emit error that message could not be sent
      }
    }
  }

  Future<ChatRoom?> createChatRoom(ChatRoom room, List<AppUser> invited) async {
    try {
      await _db.collection('chatrooms').doc(room.id.toString()).set(room.toJson());
      room = (await getChatRoom(room.id))!;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString()); // TODO: Add further error checking, upon
      }
    }
    return room;
  }

  Future<ChatRoom?> getChatRoom(String chatRoomId) async {
    ChatRoom? chatRoom;
    try {
      await _db.collection('chatrooms').doc(chatRoomId).get().then((snapshot) {
        if(snapshot.exists){
          chatRoom = ChatRoom.fromJson(snapshot.data()!);
        }else {
          if (kDebugMode) {
            print(
                'Chatroom does not exist'); //TODO: Create an exception for this error case
          }
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString()); // TODO: Add further error checking
      }
    }
    return chatRoom;
  }

  Future<List<ChatRoom?>> getChatRooms({required List<String> chatRoomIds}){
    List<ChatRoom?> chatRooms = [];
    try {
      chatRoomIds.forEach((element) async {
        await _db.collection('chatrooms').doc(element).get().then((snapshot) {
          if(snapshot.exists){
            chatRooms.add(ChatRoom.fromJson(snapshot.data()!));
          }else {
            if (kDebugMode) {
              print(
                  'Chatroom does not exist'); //TODO: Create an exception for this error case
            }
          }
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString()); // TODO: Add further error checking
      }
    }
    return Future.wait(chatRooms as Iterable<Future<ChatRoom?>>);
  }

  Future<List<ChatMessage>> getConversationMessages(ChatRoom chatRoom) async {
    List<ChatMessage> messages = [];
    try {
      await _db.collection('chatrooms').doc(chatRoom.id)
          .collection('messages')
          .get()
          .then((snapshot) {
        for (var element in snapshot.docs) {
          messages.add(ChatMessage.fromJson(element.data()));
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString()); // TODO: Add further error checking
      }
    }
    return messages;
  }


}