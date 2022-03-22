part of 'login_bloc.dart';
abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadedState extends LoginState {
  //no final
  final List<Datum> data;
  LoginLoadedState({required this.data});
  @override
  List<Object> get props => [data];
}

class LoginErrorState extends LoginState {
  //late to final
  final String message;
  LoginErrorState({required this.message});
  @override
  List<Object> get props => [message];
}