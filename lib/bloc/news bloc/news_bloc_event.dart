// import 'package:equatable/equatable.dart';
//
// abstract class NewsEvent extends Equatable{}
//
// class FetchNewsEvent extends NewsEvent{
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
part of 'news_bloc.dart';
abstract class NewsEvent extends Equatable{
  const NewsEvent();

}

class FetchNewsEvent extends NewsEvent{
  @override
  List<Object> get props => [];
}