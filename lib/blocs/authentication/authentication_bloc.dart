import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:chat_app/models/user/user.dart';
import 'package:chat_app/repositories/authentication_repository.dart';
import 'package:chat_app/services/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  AppUser? user;

  AuthenticationBloc(this._authenticationRepository) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      mapEventToState(event);
    });
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AuthenticationLoading){
      try {
        user = await _authenticationRepository.getUser();
        emit(AuthenticationUserAuthenticated(user!));
      }on NoUserFoundException catch(e){
        emit(AuthenticationLoginFailed(error: NoUserFoundException()));
        if(kDebugMode){
          print(e);
        }
      }
    }
    else if(event is AuthenticationLoginEvent){
      try{
        user = await _authenticationRepository.login(event.email, event.password);
        emit(AuthenticationUserAuthenticated(user!));
      }on NoUserFoundException {

      } catch(e){
        if(kDebugMode){
          print(e);
        }
      }
    }
    else if(event is AuthenticationLogoutEvent){
      _authenticationRepository.logout();
      emit(AuthenticationUserUnauthenticated());
    }
    else if(event is AuthenticationRegisterEvent) {
      try {
        user =
        await _authenticationRepository.register(event.email, event.password);
        emit(AuthenticationUserAuthenticated(user!));
      } catch(e){
        if(kDebugMode){
          print(e);
        }
      }
    }
  }
}
