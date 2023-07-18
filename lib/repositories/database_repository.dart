import 'package:chat_app/models/chat_room/chat_room.dart';
import 'package:chat_app/models/messages/messages.dart';
import 'package:chat_app/models/user/user.dart';

abstract class DatabaseRepository{
  /// A function used to create an instance of a chatroom and add it to the database
  Future<ChatRoom?> createChatRoom(ChatRoom chatRoom, List<AppUser> invited);

  /// A function used to add a message to the chatRoom
  Future<void> addMessage(ChatRoom chatRoom, ChatMessage message);

  /// getConversationMessages should return a list of messages from the chat room
  Future<List<ChatMessage>> getConversationMessages(ChatRoom chatRoom);

  /// getChatRooms should return a list of chat rooms that the user is a member of
  Future<List<ChatRoom?>> getChatRooms(List<String> chats);

  /// notifyChat should send a notification to all users in the chat room
  Future<void> notifyChat(ChatRoom chatRoom, List<AppUser> users);

  Future<ChatRoom?> getChatRoom(String chatRoomId);
}