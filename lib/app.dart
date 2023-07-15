import 'package:chat_app/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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

