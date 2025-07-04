part of 'detail_e_book_bloc.dart';

@immutable
sealed class DetailEBookState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DetailEBookInitial extends DetailEBookState {}

final class DetailEBookSuccessLoadIsLikedData extends DetailEBookState {
  final bool isLiked;

  DetailEBookSuccessLoadIsLikedData(this.isLiked);

  @override
  List<Object?> get props => [isLiked];
}

final class DetailEBookSuccessUpdateIsLikedData extends DetailEBookState {
  final bool isLiked;

  DetailEBookSuccessUpdateIsLikedData(this.isLiked);

  @override
  List<Object?> get props => [isLiked];
}

