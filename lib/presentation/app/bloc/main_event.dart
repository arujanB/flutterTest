import 'package:dash_chat_2/dash_chat_2.dart';

sealed class MainEvent {}

class MainInitialized extends MainEvent {}

class MessageInserted extends MainEvent {
  String myText;
  ChatUser user;

  MessageInserted({required this.myText, required this.user});
}