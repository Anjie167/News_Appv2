import 'package:api_task/database/database.dart';
import 'package:api_task/models/news_model.dart';
import 'package:api_task/views/components/news_tile.dart';
import 'package:flutter/material.dart';

class FavesList extends StatefulWidget {
  FavesList({Key? key, this.isLiked = true, }) : super(key: key);


  bool isLiked;
  @override
  State<FavesList> createState() => _FavesListState();
}
class _FavesListState extends State<FavesList> {
  @override
  Widget build(BuildContext context) {
    List<Datum> favelist = [];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.delete),
          onPressed: (){
          setState(() {
            DBProvider.db.deleteAll();
            favelist.clear();
            // widget.isLiked = !widget.isLiked;
          });


      }),
      backgroundColor: Colors.black12,
      body: FutureBuilder<List<Datum>>(
        future: DBProvider.db.getAllFavorites(),
        builder: (context,AsyncSnapshot<List<Datum>> snapshot){
          if(snapshot.hasData){
            favelist = snapshot.data!;
            if(snapshot.data!.isEmpty){
              return const Center(child: Text('No Favorites'),);
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: favelist.length,
              itemBuilder: (context,index){
                return NewsTile(
                  isLiked: widget.isLiked,
                  newsData: favelist[index],
                  onPress: () {
                    setState((){
                      DBProvider.db.deleteFavorites(favelist[index].newsId);
                      favelist.removeAt(index);
                    });
                  },
                );

              },
            );
          }
          return const Center(child: Text('No Favorites'),);
        },
      )
    );
  }
}
