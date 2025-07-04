part of 'list_liked_e_book_bloc.dart';

@immutable
sealed class ListLikedEBookEvent {}

final class ListLikedEBookRefreshDataShowLoadingEvent extends ListLikedEBookEvent{}

final class ListLikedEBookRefreshSearchDataShowLoadingEvent extends ListLikedEBookEvent{
  final String searchKeyword;

  ListLikedEBookRefreshSearchDataShowLoadingEvent(this.searchKeyword);
}

final class ListLikedEBookRefreshDataEvent extends ListLikedEBookEvent{}

final class ListLikedEBookLoadMoreDataEvent extends ListLikedEBookEvent{}

final class ListLikedEBookRefreshSearchDataEvent extends ListLikedEBookEvent{
  final String searchKeyword;

  ListLikedEBookRefreshSearchDataEvent(this.searchKeyword);
}

final class ListLikedEBookLoadMoreSearchDataEvent extends ListLikedEBookEvent{}

final class ListLikedEBookResetSearchModeEvent extends ListLikedEBookEvent{}
