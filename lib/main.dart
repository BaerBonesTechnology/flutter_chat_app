import 'package:chat_app/blocs/app_bloc_observer.dart';
import 'package:chat_app/blocs/authentication/authentication_bloc.dart';
import 'package:chat_app/repositories/impl/authentication_repository_impl.dart';
import 'package:chat_app/repositories/impl/database_repository_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/auth_form/form_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initiate instant of Firebase Auth
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                  create: (context) =>AuthenticationBloc(AuthenticationRepositoryImpl())
              ..add(AuthenticationStarted())),
              BlocProvider<FormBloc>(
                  create: (context) => FormBloc(
                    AuthenticationRepositoryImpl(), DatabaseRepositoryImpl())),
            ],
            child: const App(),
          ));
}