part of 'user_bloc.dart';

@immutable
abstract class UserBlocState {}

//class UserInitial extends UserBlocState {}

class UserLoadingState extends UserBlocState {}

class UserLoadedState extends UserBlocState {
  final List<UserModel>? model;
  UserLoadedState({this.model});
}

class UserErrorState extends UserBlocState {
  final CatchExceptions message;
  UserErrorState(this.message);
}
