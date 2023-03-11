part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupButtonPressed extends SignupEvent {
  final  BuildContext context;
  final String name;
  final String surname;
  final String email;
  final String resetPassword;
  final String password;

  const SignupButtonPressed({
    required this.context,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.resetPassword,
  });

  @override
  List<Object> get props => [name, surname, email, password, resetPassword];

  @override
  String toString() =>
      'SignupButtonPressed { name: $name, surname: $surname,  email: $email, password: $password, resetPassword: $resetPassword }';
}
