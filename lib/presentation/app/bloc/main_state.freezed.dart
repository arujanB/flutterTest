// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  String get test => throw _privateConstructorUsedError;
  List<ChatUser>? get infoCharUser => throw _privateConstructorUsedError;
  List<ChatMessage>? get chatMessage => throw _privateConstructorUsedError;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {String test,
      List<ChatUser>? infoCharUser,
      List<ChatMessage>? chatMessage});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = null,
    Object? infoCharUser = freezed,
    Object? chatMessage = freezed,
  }) {
    return _then(_value.copyWith(
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String,
      infoCharUser: freezed == infoCharUser
          ? _value.infoCharUser
          : infoCharUser // ignore: cast_nullable_to_non_nullable
              as List<ChatUser>?,
      chatMessage: freezed == chatMessage
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String test,
      List<ChatUser>? infoCharUser,
      List<ChatMessage>? chatMessage});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = null,
    Object? infoCharUser = freezed,
    Object? chatMessage = freezed,
  }) {
    return _then(_$MainStateImpl(
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String,
      infoCharUser: freezed == infoCharUser
          ? _value._infoCharUser
          : infoCharUser // ignore: cast_nullable_to_non_nullable
              as List<ChatUser>?,
      chatMessage: freezed == chatMessage
          ? _value._chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>?,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.test = '',
      final List<ChatUser>? infoCharUser = null,
      final List<ChatMessage>? chatMessage})
      : _infoCharUser = infoCharUser,
        _chatMessage = chatMessage;

  @override
  @JsonKey()
  final String test;
  final List<ChatUser>? _infoCharUser;
  @override
  @JsonKey()
  List<ChatUser>? get infoCharUser {
    final value = _infoCharUser;
    if (value == null) return null;
    if (_infoCharUser is EqualUnmodifiableListView) return _infoCharUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ChatMessage>? _chatMessage;
  @override
  List<ChatMessage>? get chatMessage {
    final value = _chatMessage;
    if (value == null) return null;
    if (_chatMessage is EqualUnmodifiableListView) return _chatMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MainState(test: $test, infoCharUser: $infoCharUser, chatMessage: $chatMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.test, test) || other.test == test) &&
            const DeepCollectionEquality()
                .equals(other._infoCharUser, _infoCharUser) &&
            const DeepCollectionEquality()
                .equals(other._chatMessage, _chatMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      test,
      const DeepCollectionEquality().hash(_infoCharUser),
      const DeepCollectionEquality().hash(_chatMessage));

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final String test,
      final List<ChatUser>? infoCharUser,
      final List<ChatMessage>? chatMessage}) = _$MainStateImpl;

  @override
  String get test;
  @override
  List<ChatUser>? get infoCharUser;
  @override
  List<ChatMessage>? get chatMessage;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
