import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_sports/features/auth/data/auth_repository.dart';

class AuthController {
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) {
    return authRepository.login(email, password);
  }

  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
    String phone,
    String age,
  ) {
    return authRepository.signup(name, email, password, phone, age);
  }
}

final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(ref.read(authRepositoryProvider)),
);
