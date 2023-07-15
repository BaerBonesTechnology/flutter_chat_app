import 'package:chat_app/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<AppUser?> login(String email, String password);
  Future<void> logout();
  Future<AppUser?> register(String email, String password);
  Future<void> verifyEmail();
  Future<AppUser?> getUser();
}