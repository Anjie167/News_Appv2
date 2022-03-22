
part of 'news_bloc.dart';
abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  //no final
  final List<Datum> data;
  NewsLoadedState({required this.data});
  @override
  List<Object> get props => [data];
}

class NewsErrorState extends NewsState {
  //late to final
  final String message;
  NewsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}