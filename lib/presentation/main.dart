import 'package:ai_bot/presentation/app.dart';
import 'package:ai_bot/presentation/app/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),
      ],
      child: const App(),
    ),
  );
}

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerFactory<MainBloc>(() => MainBloc());
}

extension DIContext on BuildContext {
  T di<T extends Object>() {
    return GetIt.instance<T>();
  }
}