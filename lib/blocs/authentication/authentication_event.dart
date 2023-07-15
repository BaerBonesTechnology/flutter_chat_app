part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// User is logging in
class AuthenticationLoginEvent extends AuthenticationEvent {
  const AuthenticationLoginEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

/// User is logging out
class AuthenticationLogoutEvent extends AuthenticationEvent {}

/// User is registering
class AuthenticationRegisterEvent extends AuthenticationEvent {
  const AuthenticationRegisterEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

/// User is verifying email
class AuthenticationVerifyEmailEvent extends AuthenticationEvent {}

/// User is resetting password
class AuthenticationResetPasswordEvent extends AuthenticationEvent {
  const AuthenticationResetPasswordEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

/// User is deleting account
class AuthenticationDeleteAccountEvent extends AuthenticationEvent {}

