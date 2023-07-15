import 'package:chat_app/models/chat_room/chat_room.dart';
import 'package:chat_app/models/messages/messages.dart';

abstract class DatabaseRepository{
  Future<ChatRoom> createChatRoom(String chatRoomId, chatRoomMap);
  Future<void> addConversationMessages(String chatRoomId, messageMap);
  Future<List<ChatMessage>> getConversationMessages(String chatRoomId);
  Future<List<ChatRoom>> getChatRooms(String userName);
}