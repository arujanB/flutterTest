import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default('') String test,
    @Default(null) List<ChatUser>? infoCharUser,
    List<ChatMessage>? chatMessage,
  }) = _MainState;
}
