part of 'detail_e_book_bloc.dart';

@immutable
sealed class DetailEBookEvent {}

final class DetailEBookFromListEBookEvent extends DetailEBookEvent{
  final EBookModel eBook;

  DetailEBookFromListEBookEvent(this.eBook);
}


final class DetailEBookFromLikedEBookEvent extends DetailEBookEvent{
  final EBookModel eBook;

  DetailEBookFromLikedEBookEvent(this.eBook);
}

final class DetailEBookSetIsLikedEBookEvent extends DetailEBookEvent {
  final EBookModel eBook;
  final bool isLiked;

  DetailEBookSetIsLikedEBookEvent({required this.eBook, required this.isLiked}); 
}
