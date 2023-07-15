part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable{}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

/// User is not logged in
class AuthenticationUserUnauthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

/// User is authenticated and verified by email
class AuthenticationUserAuthenticated extends AuthenticationState {
  AuthenticationUserAuthenticated(this.user);

  @override
  final AppUser user;

  @override
  List<Object> get props => [user];
}

/// User is authenticated but not verified by email
class AuthenticationUserAuthenticatedNotVerified extends AuthenticationState {
  AuthenticationUserAuthenticatedNotVerified(this.user);

  @override
  final AppUser user;

  @override
  List<Object> get props => [user];
}

/// Application and Authentication is loading
class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

/// User login failed
class AuthenticationLoginFailed extends AuthenticationState {
  AuthenticationLoginFailed({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}
