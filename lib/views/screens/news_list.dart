
import 'package:api_task/bloc/news%20bloc/news_bloc.dart';
import 'package:api_task/database/database.dart';
import 'package:api_task/resources/news_repository.dart';
import 'package:api_task/views/components/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatefulWidget {
  NewsList({Key? key,}) : super(key: key);


  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late NewsBloc newsBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        RepositoryProvider.of<NewsRepository>(context),
      )..add(FetchNewsEvent()),
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsLoadedState) {
              final newsList = state.data;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: newsList.length,
                itemBuilder: (context,index){
                  newsList[index].newsId = index;
                  return NewsTile(
                    newsData: newsList[index],
                    onPress: (){
                    setState((){
                        DBProvider.db.newFavorites(newsList[index]);
                      });
                  },
                  );
                },
              );
            } else if (state is NewsErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
