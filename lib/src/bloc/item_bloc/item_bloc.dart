import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/repositories/news/mock_news_repository.dart';
import 'package:test_app/src/repositories/news/models/article.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final MockNewsRepository mockNewsRepository;

  ItemBloc({
    required this.mockNewsRepository,
  }) : super(UnAuthenticated()) {
    ///get all data
    on<GetItemEvent>((event, emit) async {
      List<Article> data = await mockNewsRepository.getFeaturedArticles();
      emit(GetItemState(data));
    });

    ///get data with id
    on<GetItemWithIdEvent>((event, emit) async {
      Article data = await mockNewsRepository.getArticle(event.id);
      emit(GetItemWithIdState(data));
    });
  }
}
