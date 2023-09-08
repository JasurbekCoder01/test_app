part of 'item_bloc.dart';

@immutable
abstract class ItemState extends Equatable {}

class UnAuthenticated extends ItemState {
  @override
  List<Object?> get props => [];
}

class GetItemState extends ItemState {
  final List<Article> data;

  GetItemState(this.data);

  @override
  List<Object?> get props => [data];
}

class GetItemWithIdState extends ItemState {
  final Article data;

  GetItemWithIdState(this.data);

  @override
  List<Object?> get props => [data];
}
