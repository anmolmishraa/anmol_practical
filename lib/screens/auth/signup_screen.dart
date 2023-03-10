import 'package:auth_bloc/bloc/auth_bloc/auth.dart';
import 'package:auth_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:auth_bloc/repositories/repositories.dart';
import 'package:auth_bloc/screens/auth/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  final UserRepository userRepository;

  SignupScreen({required Key key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return SignupBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: SignupForm(
          userRepository: userRepository,
          key: UniqueKey(),
        ),
      ),
    );
  }
}
