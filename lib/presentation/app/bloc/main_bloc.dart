// import 'package:ai_bot/consts.dart';
// import 'package:ai_bot/presentation/app/bloc/main_event.dart';
// import 'package:ai_bot/presentation/app/bloc/main_state.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class MainBloc extends Bloc<MainEvent, MainState> {
//   MainBloc() : super(const MainState()) {
//     _setupObserver();
//     add(MainInitialized());
//   }
//
//   final openAI = OpenAI.instance.build(
//       token: GPT_API,
//       baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5),),
//       enableLog: true,
//   );
//
//   void _setupObserver() {
//     on<MainInitialized>(_initialize);
//     on<MessageInserted>(_insertMessage);
//   }
//
//   Future<void> _initialize(
//       MainInitialized event,
//       Emitter<MainState> emit,
//       ) async {
//     ChatUser user = ChatUser(id: '1', firstName: "Aruzhan");
//     ChatUser gptChat = ChatUser(id: '2', firstName: "GPT");
//     emit(state.copyWith(infoCharUser: [user, gptChat]));
//   }
//
//   Future<void> _insertMessage(
//       MessageInserted event,
//       Emitter<MainState> emit,
//       ) async {
//     final newMessage = ChatMessage(
//       text: event.myText,
//       user: event.user,
//       createdAt: DateTime.now(),
//     );
//
//     final updatedMessages = [...?state.chatMessage, newMessage];
//     emit(state.copyWith(chatMessage: updatedMessages));
//
//     List<Map<String, dynamic>> _messageHistory = updatedMessages.map((message) {
//       return {
//         'role': message.user == state.infoCharUser?[0] ? 'user' : 'assistant',
//         'content': message.text,
//       };
//     }).toList();
//
//     try {
//       final request = ChatCompleteText(
//         model: GptTurbo0301ChatModel(),
//         messages: _messageHistory,
//         maxToken: 200,
//       );
//
//       final response = await openAI.onChatCompletion(request: request);
//
//       if (response?.choices.isNotEmpty == true) {
//         final assistantMessage = response!.choices.first.message;
//         if (assistantMessage != null) {
//           updatedMessages.add(ChatMessage(
//             text: assistantMessage.content,
//             user: state.infoCharUser?[1] ?? ChatUser(id: '2'),
//             createdAt: DateTime.now(),
//           ));
//         }
//       }
//     } catch (error) {
//       print("Error: $error");
//     }
//   }
//
//   Future<void> _insetMessage(
//       MessageInserted event,
//       Emitter<MainState> emit,
//       ) async {
//     final newMessage = ChatMessage(
//       text: event.myText,
//       user: event.user,
//       createdAt: DateTime.now(),
//     );
//
//     final updatedMessages = [...?state.chatMessage]..insert(0, newMessage);
//
//     emit(state.copyWith(chatMessage: updatedMessages));
//
//     List<Messages> _messageHistory = state.chatMessage?.reversed.map( (message) {
//       if (message.user == state.infoCharUser?[0]) {
//         return Messages(role: Role.user, content: message.text);
//       } else {
//         return Messages(role: Role.assistant, content: message.text);
//       }
//     }).toList() ?? [];
//
//     final request = ChatCompleteText(model: GptTurbo0301ChatModel(), messages: _messageHistory, maxToken: 200);
//     final response = await openAI.onChatCompletion(request: request);
//     for (var element in response!.choices) {
//       if (element.message != null) {
//         updatedMessages.insert(0, ChatMessage(
//           text: element.message!.content,
//           user: state.infoCharUser?[1] ?? ChatUser(id: '2'),
//           createdAt: DateTime.now(),
//
//         ));
//       }
//     }
//   }
// }

import 'package:ai_bot/consts.dart';
import 'package:ai_bot/presentation/app/bloc/main_event.dart';
import 'package:ai_bot/presentation/app/bloc/main_state.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    _setupObserver();
    add(MainInitialized());
  }

  final openAI = OpenAI.instance.build(
    token: GPT_API,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
    ),
    enableLog: true,
  );

  void _setupObserver() {
    on<MainInitialized>(_initialize);
    on<MessageInserted>(_insertMessage);
  }

  Future<void> _initialize(
      MainInitialized event,
      Emitter<MainState> emit,
      ) async {
    ChatUser user = ChatUser(id: '1', firstName: "Aruzhan");
    ChatUser gptChat = ChatUser(id: '2', firstName: "GPT");
    emit(state.copyWith(infoCharUser: [user, gptChat]));
  }

  Future<void> _insertMessage(
      MessageInserted event,
      Emitter<MainState> emit,
      ) async {
    try {
      final newMessage = ChatMessage(
        text: event.myText,
        user: event.user,
        createdAt: DateTime.now(),
      );

      final updatedMessages = [...?state.chatMessage, newMessage];
      emit(state.copyWith(chatMessage: updatedMessages));

      List<Map<String, dynamic>> _messageHistory = updatedMessages.map((message) {
        return {
          'role': message.user == state.infoCharUser?[0] ? 'user' : 'assistant',
          'content': message.text,
        };
      }).toList();

      final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: _messageHistory,
        maxToken: 200,
      );

      final response = await openAI.onChatCompletion(request: request);
      for (var element in response!.choices) {
        if (element.message != null) {
          final assistantMessage = ChatMessage(
            text: element.message!.content,
            user: state.infoCharUser?[1] ?? ChatUser(id: '2'),
            createdAt: DateTime.now(),
          );

          emit(state.copyWith(chatMessage: [...updatedMessages, assistantMessage]));
        }
      }
    } catch (e) {
      print('Error during API request: $e');
    }
  }

}
