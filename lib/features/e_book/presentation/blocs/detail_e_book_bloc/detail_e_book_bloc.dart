import 'package:bloc/bloc.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_is_liked_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/set_like_e_book_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'detail_e_book_event.dart';
part 'detail_e_book_state.dart';

class DetailEBookBloc extends Bloc<DetailEBookEvent, DetailEBookState> {
  GetDataIsLikedEBookUsecase getDataIsLikedEBookUsecase;
  SetLikeEBookUsecase setLikeEBookUsecase;

  DetailEBookBloc({required this.getDataIsLikedEBookUsecase, required this.setLikeEBookUsecase}) : super(DetailEBookInitial()) {
    on<DetailEBookFromLikedEBookEvent>(_onGetIsLikedEBookFromLikedEBook);
    on<DetailEBookFromListEBookEvent>(_onGetIsLikedEBookFromListEBook);
    on<DetailEBookSetIsLikedEBookEvent>(_onSetLikeEBook);
  }

  Future<void> _onGetIsLikedEBookFromLikedEBook(
      DetailEBookEvent event, Emitter<DetailEBookState> emit) async {
    emit(DetailEBookSuccessLoadIsLikedData(true));
  }

  Future<void> _onGetIsLikedEBookFromListEBook(
      DetailEBookEvent event, Emitter<DetailEBookState> emit) async {
    final result = await getDataIsLikedEBookUsecase.execute((event as DetailEBookFromListEBookEvent).eBook.bookId);
    emit(DetailEBookSuccessLoadIsLikedData(result));
  }

  

  Future<void> _onSetLikeEBook(
      DetailEBookEvent event, Emitter<DetailEBookState> emit) async {
    await setLikeEBookUsecase.execute(bookId: (event as DetailEBookSetIsLikedEBookEvent).eBook.bookId, isLiked: (event as DetailEBookSetIsLikedEBookEvent).isLiked);
    emit(DetailEBookSuccessUpdateIsLikedData((event as DetailEBookSetIsLikedEBookEvent).isLiked));
  }
}
