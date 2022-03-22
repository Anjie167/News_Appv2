import 'package:api_task/resources/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_task/models/news_model.dart';
import 'package:equatable/equatable.dart';

part 'news_bloc_event.dart';
part 'news_bloc_state.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc(this._newsRepository) : super(NewsLoadingState()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        List<Datum> data = await _newsRepository.getNews();
        emit(NewsLoadedState(data: data));
      } catch (e) {
        emit(NewsErrorState(message: e.toString()));
      }
    });
  }
}
