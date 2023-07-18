import 'package:chat_app/models/chat_room/chat_room.dart';
import 'package:chat_app/models/messages/messages.dart';
import 'package:chat_app/models/user/user.dart';
import 'package:chat_app/repositories/database_repository.dart';
import 'package:chat_app/services/database_service.dart';

class DatabaseRepositoryImpl extends DatabaseRepository{
  DatabaseService service = DatabaseService();

  @override
  Future<void> addMessage(ChatRoom chatRoom, ChatMessage message) async {
    try{
      service.addMessage(chatRoom, message);
    }catch(e){
      print(e.toString()); // TODO: Add further error checking
    }
  }

  @override
  Future<ChatRoom?> createChatRoom(ChatRoom chatRoom, List<AppUser> invited) async {
    ChatRoom? room;
    try{
      room = await service.createChatRoom(chatRoom, chatRoom.invited);
    }catch(e){
      print(e.toString()); // TODO: Add further error checking, upon
    }
    return room;
  }

  @override
  Future<List<ChatRoom?>> getChatRooms(List<String> chats) async {
    List<ChatRoom> chatRooms = [];
    try{
      service.getChatRooms(chatRoomIds: chats).then((value) {
          value.forEach((element) {
            if(element != null){
              chatRooms.add(element);
            }
          });
      }
      );
    }catch(e){
      print(e.toString()); // TODO: Add further error checking
    }
    return chatRooms;
  }

  @override
  Future<ChatRoom?> getChatRoom(String chatRoomId) async {
    ChatRoom? chatRoom;
    try{
      chatRoom = await service.getChatRoom(chatRoomId);
    }catch(e){
      print(e.toString()); // TODO: Add further error checking
    }
    return chatRoom!;
  }

  @override
  Future<List<ChatMessage>> getConversationMessages(ChatRoom chatRoom) async {
    List<ChatMessage> messages = [];
    try{
      messages.addAll(await service.getConversationMessages(chatRoom));
    }catch(e){
      print(e.toString()); // TODO: Add further error checking
    }
    return messages;
  }

  @override
  Future<void> notifyChat(ChatRoom chatRoom, List<AppUser> users) async {
    try{
      service.notifyChat(chatRoom, users);
    }catch(e) {
      print(e.toString()); // TODO: Add further error checking
      }
  }

}