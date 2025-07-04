part of 'list_e_book_bloc.dart';

@immutable
sealed class ListEBookEvent {}

final class ListEBookRefreshDataEBookShowLoadingEvent extends ListEBookEvent{}

final class ListEBookRefreshSearchDataEBookShowLoadingEvent extends ListEBookEvent{
  final String searchKeyword;

  ListEBookRefreshSearchDataEBookShowLoadingEvent(this.searchKeyword);
}

final class ListEBookRefreshDataEBookEvent extends ListEBookEvent{}

final class ListEBookLoadMoreDataEBookEvent extends ListEBookEvent{}

final class ListEBookRefreshSearchDataEBookEvent extends ListEBookEvent{
  final String searchKeyword;

  ListEBookRefreshSearchDataEBookEvent(this.searchKeyword);
}

final class ListEBookLoadMoreSearchDataEBookEvent extends ListEBookEvent{}

final class ListEBookResetSearchModeEvent extends ListEBookEvent{}