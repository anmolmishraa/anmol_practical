import 'dart:async';

import 'package:auth_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:auth_bloc/bloc/auth_bloc/auth_event.dart';
import 'package:auth_bloc/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignupBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  SignupState get initialState => SignupInitial();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressed) {
      yield SignupLoading();

      try {
        final token = await userRepository.signup(
          event.name,
          event.surname,
          event.email,
          event.password,
          event.resetPassword,
        );
        authenticationBloc.add(SignedIn(token: token));
        yield SignupInitial();
      } catch (error) {
        yield SignupFailure(error: error.toString());
      }
    }
  }
}
