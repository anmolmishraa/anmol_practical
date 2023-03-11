// import 'package:auth_bloc/model/cart_response_wrapper.dart';
// import 'package:auth_bloc/repositories/repositories.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
//
// part 'cart_event.dart';
// part 'cart_state.dart';
//
// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartInitial()) {
//     final UserRepository userRepository = UserRepository();
//
//     on<GetCartList>((event, emit) async {
//       try {
//         emit(CartLoading());
//         final mList = await userRepository.fetchCartList();
//         emit(CartLoaded(mList));
//         if (mList.error != null) {
//           emit(CartError(mList.error));
//         }
//       } on NetworkError {
//         emit(CartError("Failed to fetch data. is your device online?"));
//       }
//     });
//   }
// }