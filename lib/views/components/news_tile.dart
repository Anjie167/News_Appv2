import 'package:api_task/database/database.dart';
import 'package:api_task/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatefulWidget {
  NewsTile({
    Key? key,
    required this.newsData,
    this.isLiked = false,
    required this.onPress,
  }) : super(key: key);

  final Datum newsData;
  bool isLiked;

  final Function() onPress;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6.0,
      child: Container(
        height: size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            // IconButton(
            //     onPressed:
            //       widget.onPress,
            //     icon:
            GestureDetector(
              onTap: widget.onPress,
              child: widget.isLiked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40,
                    )
                  : const Icon(Icons.favorite_border,
                      size: 36, color: Colors.black45),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.newsData.title,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.newsData.summary,
                      maxLines: 2,
                    ),
                    Text(
                      widget.newsData.published,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dismissible(
// key: UniqueKey(),
// onDismissed: (direction){
// DBProvider.db.deleteFavorites(widget.newsData.newsId);
// },
