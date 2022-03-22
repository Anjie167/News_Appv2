import 'package:api_task/resources/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_task/models/news_model.dart';
import 'package:equatable/equatable.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final NewsRepository _newsRepository;

  LoginBloc(this._newsRepository) : super(LoginLoadingState()) {
    on<FetchLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        List<Datum> data = await _newsRepository.getNews();
        emit(LoginLoadedState(data: data));
      } catch (e) {
        emit(LoginErrorState(message: e.toString()));
      }
    });
  }
}
