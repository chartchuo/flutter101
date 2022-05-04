part of 'cocktail_bloc.dart';

@immutable
abstract class CocktailEvent {}

class SearchEvent extends CocktailEvent {
  final String searchText;

  SearchEvent(this.searchText);
}
