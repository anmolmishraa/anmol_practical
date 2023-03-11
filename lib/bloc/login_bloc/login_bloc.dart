import 'dart:async';

import 'package:auth_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:auth_bloc/bloc/auth_bloc/auth_event.dart';
import 'package:auth_bloc/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      print("!!!!!!!!!!!!!!${event.email}!!!!!!!!!!!!!!!!");
      print("!!!!!!!!!!!!!!${event.password}!!!!!!!!!!!!!!!!");
      // dainikss12122@gmail.com
      try {
        print("2222222222222222222222");
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token.toString()));
        yield LoginInitial();
      } catch (error, s) {
        print("++++++++++++++++${error}");
        print("_________________${s}");
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
