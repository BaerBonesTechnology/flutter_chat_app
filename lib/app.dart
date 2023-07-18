import 'package:chat_app/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router
    );
  }
}

// Bloc navigation
class BlocNavigate extends StatelessWidget {
  const BlocNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state){
        if(state is AuthenticationUserAuthenticated){
          return const Placeholder();
        }else if(state is AuthenticationUserUnauthenticated){
          return const Placeholder();
        }else if(state is AuthenticationLoading){
          return const Placeholder();
        }else{
          return const Placeholder();
        }
      },
    );
  }
}

//Go_Router navigation
GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BlocNavigate(),
    ),
    GoRoute(
      path: '/chatRoom/:chatRoomId',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/profile/:userId',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const Placeholder(),
    ),
  ],
);

GoRouter get router => _router;

