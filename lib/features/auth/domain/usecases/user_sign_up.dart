import 'package:first_pj/core/error/failures.dart';
import 'package:first_pj/core/usecases/usecase.dart';
import 'package:first_pj/features/auth/domain/repositoty/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
