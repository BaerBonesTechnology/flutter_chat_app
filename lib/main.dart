import 'package:chat_app/blocs/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initiate instant of Firebase Auth
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides
      .runZoned(
          () => runApp(MultiBlocProvider(
            providers: [

            ],
            child: const App(),
          )),
    blocObserver: AppBlocObserver()
  );
}