import 'package:api_task/resources/news_repository.dart';
import 'package:api_task/views/screens/sign_in.dart';
import 'package:api_task/views/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context)=>NewsRepository(),
        child: const SignUpPage(),
      ),
    );
  }
}
