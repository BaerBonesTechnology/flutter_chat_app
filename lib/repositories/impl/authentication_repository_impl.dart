import 'package:chat_app/services/authentication_service.dart';
import '../../models/user/user.dart';
import '../authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  AuthenticationService service = AuthenticationService();

  @override
  Future<AppUser?> getUser() async {
    AppUser? user;
    service.retrieveUser().then((value) => user = value);
    return user;
  }

  @override
  Future<AppUser?> login(String email, String password) async {
    AppUser? user;
    await service.signIn(email, password).then((value) => user = value);
    return user;
  }

  @override
  Future<void> logout() async {
    await service.signOut();
  }

  @override
  Future<AppUser?> register(String email, String password) async {
   AppUser? user;
   await service.signUp(email, password).then((value) => user = value);
   verifyEmail();
   return user;
  }

  @override
  Future<void> verifyEmail() async {
    await service.verifyEmail();
  }

}