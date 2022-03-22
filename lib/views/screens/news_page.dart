import 'package:api_task/models/news_model.dart';
import 'package:api_task/views/components/bottom_button.dart';
import 'package:api_task/views/screens/faves_list.dart';
import 'package:api_task/views/screens/news_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState

    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  void jumpToNextPage() {
    pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  void jumpToPrevPage() {
    pageController.previousPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  int _page = 0;

  void onPageChanged(page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> screens = [
     NewsList(),
     FavesList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: screens,
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.black12,
          child: Row(
            children: [
              BottomButton(
                icon: Icons.list,
                text: 'News',
                onTap: jumpToPrevPage,
                color: _page == 0 ? Colors.blue[900] : Colors.white,
                textColor: _page == 0 ? Colors.white :Colors.black,
                iconColor:  _page == 0 ? Colors.white : Colors.black54,
              ),
              const Spacer(),
              BottomButton(
                icon: Icons.favorite,
                text: 'Favs',
                onTap: jumpToNextPage,
                color: _page == 1 ? Colors.blue[900] : Colors.white,
                textColor: _page == 1 ? Colors.white: Colors.black,
                iconColor:_page == 1 ?Colors.white: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
