import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/constants/Regex.dart';
import 'package:chat_app/repositories/authentication_repository.dart';
import 'package:chat_app/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsValidate> {
  final AuthenticationRepository _authenticationRepository;
  final DatabaseRepository _databaseRepository;

  FormBloc(this._authenticationRepository,this._databaseRepository)
  : super(const FormsValidate(
      email: "",
      password: "",
      isEmailValid: true,
      isPasswordValid: true,
      isFormValid: false,
      isLoading: false,
      isNameValid: true,
      isAgeValid: true,
      isFormValidateFailed: false,
      age: 0
  )){

  }

 bool _isEmailValid(String email) {
    return emailRegex.hasMatch(email);
 }

 _onEmailChanged(EmailChanged event, Emitter<FormsValidate> emit){
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: false,
      isFormValidateFailed:false,
      errorMessage: "",
      email: event.email,
      isEmailValid: _isEmailValid(event.email),
    ));
 }

 bool _isPasswordValid(String password){
    return passwordRegex.hasMatch(password);
 }

 _onPasswordChanged(PasswordChanged event, Emitter<FormsValidate> emit){
    emit(state.copyWith(
      isFormValid: false,
      isFormSuccessful: false,
      isFormValidateFailed: false,
      errorMessage: _isPasswordValid(event.password) ? "" : 'Invalid Password.',
      password: event.password,
      isPasswordValid: _isPasswordValid(event.password),
    ));


 }

}
