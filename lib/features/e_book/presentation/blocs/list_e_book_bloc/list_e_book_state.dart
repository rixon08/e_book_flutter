part of 'list_e_book_bloc.dart';

@immutable
sealed class ListEBookState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ListEBookInitialState extends ListEBookState {}

final class ListEBookRefreshingDataState extends ListEBookState {}

final class ListEBookLoadingDataState extends ListEBookState {
  final bool isShowLoadingCircular;

  ListEBookLoadingDataState({this.isShowLoadingCircular = false});

  @override
  List<Object?> get props => [isShowLoadingCircular];
}

final class ListEBookFailedLoadDataState extends ListEBookState {
  final String errorMessage;

  ListEBookFailedLoadDataState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ListEBookSuccessRefreshDataState extends ListEBookState {
  final List<EBookModel> eBook;
  final bool isLastData;

  ListEBookSuccessRefreshDataState(this.eBook, this.isLastData);

  @override
  List<Object?> get props => [eBook, isLastData];
}

final class ListEBookSuccessLoadDataState extends ListEBookState {
  final List<EBookModel> eBook;
  final bool isLastData;

  ListEBookSuccessLoadDataState(this.eBook, this.isLastData);

  @override
  List<Object?> get props => [eBook, isLastData];
}

final class ListEBookResetDataState extends ListEBookState {
  final List<EBookModel> eBook;
  final bool isLastData;

  ListEBookResetDataState(this.eBook, this.isLastData);

  @override
  List<Object?> get props => [eBook, isLastData];
}
