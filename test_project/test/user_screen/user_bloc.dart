import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/screens/user_screen/bloc/user_bloc.dart';
import 'package:test_project/screens/user_screen/bloc/user_repository.dart';
import 'package:test_project/screens/user_screen/model/user_model.dart';

class MockUserBloc extends MockBloc<UserBlocEvent, UserBlocState>
    implements UserBloc {}

// void main() {
//   List<UserModel> data = [
//     UserModel(
//         id: 2,
//         name: 'miki',
//         username: 'miki123',
//         email: 'miki@mail.ru',
//         phone: '123123',
//         address: Address(city: 'Bishkek'))
//   ];
//   print("DATA ===== $data");

//   group('UserBloc', () {
//     blocTest<UserBloc, UserBlocState>(
//       'emits [UserLoading, UserLoaded] when successful',
//       build: () => UserBloc(UserRepository()),
//       act: (bloc) => bloc.add(GetUserEvent()),
//       expect: () => [UserLoadingState(), UserLoadedState(model: data)],
//     );
//   });
// }

// void main() {

//   MockUserBloc? userBloc;
//   setUp(() {
//     userBloc = MockUserBloc();
//   });

//   test('example', () {
//     whenListen(userBloc!,
//         Stream.fromIterable([UserLoadingState(), UserLoadedState()]));
//     expectLater(userBloc, emitsInOrder([UserLoadedState(), UserLoadedState()]));
//   });

// }

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:list_users/data/blocs/user/user_bloc.dart';
// import 'package:list_users/data/fake_data/user_fake.dart';

// import 'package:list_users/data/repositories/user_repository.dart';

void main() {
  late UserRepository userRepository;
  late UserBloc userBloc;

  setUp(() {
    userRepository = UserRepository();
    userBloc = UserBloc(userRepository);
  });
  
  blocTest<UserBloc, UserBlocState>(
    'Get user test',
    build: () => userBloc,
    act: (userBloc) => userBloc.add(GetUserEvent()),
    expect: () => [UserLoadingState(), UserLoadedState()],
  );
}
