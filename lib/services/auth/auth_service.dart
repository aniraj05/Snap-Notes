import 'package:snap_notes/services/auth/auth_provider.dart';
import 'package:snap_notes/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  AuthUser? get currentUser => provider.currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn (
        email: email,
        password: password,
  );

  Future<void> logOut() => provider.logOut();

  Future<void> sendEmailVerification() => provider.sendEmailVerification();

}