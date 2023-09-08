import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/bloc/item_bloc/item_bloc.dart';
import 'package:test_app/src/ui/main/item_screen.dart';

import 'src/repositories/news/repository.dart';

void main() {
  runApp(const TestAppScreen());
}

class TestAppScreen extends StatelessWidget {
  const TestAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      home: RepositoryProvider(
        create: (context) => MockNewsRepository(),
        child: BlocProvider(
          create: (context) => ItemBloc(
            mockNewsRepository:
                RepositoryProvider.of<MockNewsRepository>(context),
          ),
          child: const ItemScreen(),
        ),
      ),
    );
  }
}
