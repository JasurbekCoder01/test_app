part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {}

class CheckLoginEvent extends ItemEvent {
  @override
  List<Object?> get props => [];
}

class GetItemEvent extends ItemEvent {
  @override
  List<Object?> get props => [];
}

class GetItemWithIdEvent extends ItemEvent {
  final String id;

  GetItemWithIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}
