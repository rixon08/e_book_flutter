import 'package:bloc/bloc.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_liked_e_book_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'list_liked_e_book_event.dart';
part 'list_liked_e_book_state.dart';

class ListLikedEBookBloc
    extends Bloc<ListLikedEBookEvent, ListLikedEBookState> {
  final List<EBookModel> _eBookDefault = [];
  final List<EBookModel> _eBook = [];
  bool _isLastData = false;
  bool _isLastDataDefault = false;
  bool _isSearchMode = false;
  GetDataLikedEBookUsecase getDataLikedEBookUsecase;

  ListLikedEBookBloc({required this.getDataLikedEBookUsecase})
      : super(ListLikedEBookInitial()) {
    on<ListLikedEBookRefreshDataEvent>(_onRefreshDataEBook);
    on<ListLikedEBookRefreshDataShowLoadingEvent>(
        _onRefreshDataLikedEBookShowLoading);
    // on<ListLikedEBookLoadMoreDataEvent>(_onLoadMoreDataEBook);
    on<ListLikedEBookRefreshSearchDataEvent>(_onRefreshSearchDataEBook);
    // on<ListEBookLoadMoreSearchDataEBookEvent>(_onLoadMoreDataEBook);
    on<ListLikedEBookRefreshSearchDataShowLoadingEvent>(
        _onRefreshSearchDataLikedEBookShowLoading);
    on<ListLikedEBookResetSearchModeEvent>(_onResetSearchMode);
    
  }

  Future<void> _onRefreshSearchDataLikedEBookShowLoading(
      ListLikedEBookEvent event, Emitter<ListLikedEBookState> emit) async {
    await _onRefreshSearchDataEBook(event, emit, isShowLoadingCircular: true);
  }

  Future<void> _onRefreshDataLikedEBookShowLoading(
      ListLikedEBookEvent event, Emitter<ListLikedEBookState> emit) async {
    await _onRefreshDataEBook(event, emit, isShowLoadingCircular: true);
  }

  Future<void> _onRefreshDataEBook(
      ListLikedEBookEvent event, Emitter<ListLikedEBookState> emit,
      {bool isShowLoadingCircular = false}) async {
    _isSearchMode = false;
    emit(ListLikedEBookLoadingDataState(
        isShowLoadingCircular: isShowLoadingCircular));
    final resultData = await getDataLikedEBookUsecase.execute();
    _eBook.clear();
    _eBookDefault.clear();
    _eBook.addAll(resultData);
    _eBookDefault.addAll(resultData);
    emit(ListLikedEBookSuccessRefreshDataState(_eBook, _isLastData));
  }

  Future<void> _onRefreshSearchDataEBook(
      ListLikedEBookEvent event, Emitter<ListLikedEBookState> emit,
      {bool isShowLoadingCircular = false}) async {
    _isSearchMode = true;
    emit(ListLikedEBookLoadingDataState(
        isShowLoadingCircular: isShowLoadingCircular));
    String search = "";
    if (event is ListLikedEBookRefreshSearchDataEvent) {
      search =
          "${(event as ListLikedEBookRefreshSearchDataEvent).searchKeyword}";
    } else if (event is ListLikedEBookRefreshSearchDataShowLoadingEvent) {
      search =
          "${(event as ListLikedEBookRefreshSearchDataShowLoadingEvent).searchKeyword}";
    }
    final resultApi = await getDataLikedEBookUsecase.execute(search: search);
    _eBook.clear();
    _eBook.addAll(resultApi);
    return emit(ListLikedEBookSuccessRefreshDataState(_eBook, _isLastData));
  }

  Future<void> _onResetSearchMode(
      ListLikedEBookEvent event, Emitter<ListLikedEBookState> emit) async {
    _isSearchMode = false;
    _eBook.clear();
    _eBook.addAll(_eBookDefault);
    _isLastData = _isLastDataDefault;
    emit(ListLikedEBookResetDataState(_eBook, _isLastData));
  }

  // void _setNextUrl(String? url) {
  //   final String? nextUrl = url;
  //   _isLastData = nextUrl == null;
  //   if (!_isSearchMode) {
  //     _isLastDataDefault = _isLastData;
  //   }
  //   _nextPage = UrlHelper.extractQueryParams(nextUrl ?? "");
  // }
}
