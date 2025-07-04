part of 'list_liked_e_book_bloc.dart';

@immutable
sealed class ListLikedEBookState extends Equatable {
  const ListLikedEBookState();

  @override
  List<Object?> get props => [];
}

final class ListLikedEBookInitial extends ListLikedEBookState {}

final class ListLikedEBookRefreshingDataState extends ListLikedEBookState {}

final class ListLikedEBookLoadingDataState extends ListLikedEBookState {
  final bool isShowLoadingCircular;

  const ListLikedEBookLoadingDataState({this.isShowLoadingCircular = false});

  @override
  List<Object?> get props => [isShowLoadingCircular];
}

final class ListLikedEBookFailedLoadDataState extends ListLikedEBookState {
  final String errorMessage;

  const ListLikedEBookFailedLoadDataState(this.errorMessage);
}

final class ListLikedEBookSuccessRefreshDataState extends ListLikedEBookState {
  final List<EBookModel> eBook;
  final bool isLastData;

  const ListLikedEBookSuccessRefreshDataState(this.eBook, this.isLastData);

  @override
  List<Object?> get props => [eBook, isLastData];

}

final class ListLikedEBookSuccessLoadDataState extends ListLikedEBookState {
  final List<EBookModel> eBook;
  final bool isLastData;

  const ListLikedEBookSuccessLoadDataState(this.eBook, this.isLastData);

  @override
  List<Object?> get props => [eBook, isLastData];
}

final class ListLikedEBookResetDataState extends ListLikedEBookState {
  final List<EBookModel> eBook;
  final bool isLastData;

  ListLikedEBookResetDataState(this.eBook, this.isLastData);
}

