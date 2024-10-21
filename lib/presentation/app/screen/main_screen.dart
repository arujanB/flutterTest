// import 'package:ai_bot/consts.dart';
// import 'package:ai_bot/presentation/app/bloc/main_bloc.dart';
// import 'package:ai_bot/presentation/app/bloc/main_event.dart';
// import 'package:ai_bot/presentation/app/bloc/main_state.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   final openAI = OpenAI.instance.build(
//     token: GPT_API,
//     baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5),),
//     enableLog: true,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             "Чат",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 17,
//                 fontWeight: FontWeight.w700
//             ),
//           ),
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: BlocBuilder<MainBloc, MainState>(
//         builder: (BuildContext context, MainState state) {
//           return Scaffold(
//             backgroundColor: Colors.black87,
//             body: DashChat(
//               currentUser: state.infoCharUser?[0] ?? ChatUser(id: '1'),
//               onSend: (send) {
//                 setState(() {
//                   context.read<MainBloc>().add(
//                       MessageInserted(myText: send.text, user: state.infoCharUser?[0] ?? ChatUser(id: '1'))
//                   );
//                 });
//                 print('${state.infoCharUser?[0].firstName} ${send.text}');
//               },
//               messages: state.chatMessage ?? [],
//               messageOptions: const MessageOptions(
//                 currentUserContainerColor: Colors.black38
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:ai_bot/consts.dart';
import 'package:ai_bot/presentation/app/bloc/main_bloc.dart';
import 'package:ai_bot/presentation/app/bloc/main_event.dart';
import 'package:ai_bot/presentation/app/bloc/main_state.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final openAI = OpenAI.instance.build(
    token: GPT_API,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
    ),
    orgId: "org-WdN0zPTypAqZLCgSPVDmYiMq",
  );

  final ChatUser _currentUser = ChatUser(id: '1', firstName: "Aruzhan");
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: "GPT");
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Чат",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (BuildContext context, MainState state) {
          return Scaffold(
            backgroundColor: Colors.black87,
            body: DashChat(
              currentUser: _currentUser,
              onSend: (send) {
                _sendMessageWithSSE(send);
                print('${state.infoCharUser?[0].firstName} ${send.text}');
              },
              messages: _messages,
              messageOptions: const MessageOptions(
                currentUserContainerColor: Colors.black38,
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to handle sending messages and receiving SSE stream
  Future<void> _sendMessageWithSSE(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m); // Add the user's message to the chat
    });

    List<Map<String, dynamic>> _messageHistory = _messages.reversed.map((message) {
      return {
        'role': message.user == _currentUser ? 'user' : 'assistant',
        'content': message.text,
      };
    }).toList();

    final request = CompleteText(
      prompt: m.text,
      maxTokens: 200,
      model: GptTurbo0301AModel().//Gpt3Model.textDavinci3(),
    );

    // Start listening to the SSE response stream
    openAI.onCompletionSSE(request: request).listen((it) {
      final botResponse = it.choices.last.text.trim();

      if (botResponse.isNotEmpty) {
        setState(() {
          // Insert the bot's response into the chat
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: botResponse,
            ),
          );
        });
      }
    }, onError: (error) {
      debugPrint('Error occurred: $error');
    });
  }
}
