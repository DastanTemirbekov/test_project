import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/helpers/catch_exceptions.dart';
import 'package:test_project/screens/user_screen/bloc/user_repository.dart';
import 'package:test_project/screens/user_screen/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

// class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
//   UserRepository repository = UserRepository();
//   UserBloc(UserRepository userRepository) : super(UserInitial());

//   @override
//   Stream<UserBlocState> mapEventToState(
//     UserBlocEvent event,
//   ) async* {
//     if (event is GetUserEvent) {
//       yield UserLoadingState();
//       try {
//         List<UserModel> data = await repository.getUser();
//         yield UserLoadedState(data);
//       } catch (e) {
//         yield UserErrorState(CatchExceptions.convertException(e));
//       }
//     }
//   }
// }

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserRepository repository = UserRepository();
  UserBloc(this.repository) : super(UserLoadingState()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is GetUserEvent) {
        emit(UserLoadingState());
        try {
          List<UserModel> data = await repository.getUser();
          emit(UserLoadedState(model: data));
        } catch (e) {
          emit(UserErrorState(CatchExceptions.convertException(e)));
        }
      }
    });
  }
}
