import 'package:bloc/bloc.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/features/e_book/data/helpers/url_helper.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_e_book_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'list_e_book_event.dart';
part 'list_e_book_state.dart';

class ListEBookBloc extends Bloc<ListEBookEvent, ListEBookState> {
  final List<EBookModel> _eBookDefault = [];
  final List<EBookModel> _eBook = [];
  String _nextPage = "";
  bool _isLastData = false;
  bool _isLastDataDefault = false;
  bool _isSearchMode = false;
  GetDataEBookUsecase getDataEBookUsecase;

  ListEBookBloc(this.getDataEBookUsecase) : super(ListEBookInitialState()) {
    on<ListEBookRefreshDataEBookEvent>(_onRefreshDataEBook);
    on<ListEBookLoadMoreDataEBookEvent>(_onLoadMoreDataEBook);
    on<ListEBookRefreshSearchDataEBookEvent>(_onRefreshSearchDataEBook);
    on<ListEBookLoadMoreSearchDataEBookEvent>(_onLoadMoreDataEBook);
    on<ListEBookResetSearchModeEvent>(_onResetSearchMode);
    on<ListEBookRefreshSearchDataEBookShowLoadingEvent>(_onRefreshSearchDataEBookShowLoading);
    on<ListEBookRefreshDataEBookShowLoadingEvent>(_onRefreshDataEBookShowLoading);
  }

  Future<void> _onRefreshSearchDataEBookShowLoading(
      ListEBookEvent event, Emitter<ListEBookState> emit) async {
    await _onRefreshSearchDataEBook(event, emit, isShowLoadingCircular: true);
  }

  Future<void> _onRefreshDataEBookShowLoading(
      ListEBookEvent event, Emitter<ListEBookState> emit) async {
    await _onRefreshDataEBook(event, emit, isShowLoadingCircular: true);
  }

  Future<void> _onRefreshDataEBook(
      ListEBookEvent event, Emitter<ListEBookState> emit, {bool isShowLoadingCircular = false}) async {
    _isSearchMode = false;
    emit(ListEBookLoadingDataState(isShowLoadingCircular: isShowLoadingCircular));
    final resultApi = await getDataEBookUsecase.execute();
    resultApi.fold(
      (failure) => emit(ListEBookFailedLoadDataState(AppStrings.errorMessage)),
      (apiResponse) {
        _setNextUrl(apiResponse.next);
        _eBook.clear();
        _eBookDefault.clear();
        _eBook.addAll(apiResponse.data ?? []);
        _eBookDefault.addAll(apiResponse.data ?? []);
        return emit(ListEBookSuccessRefreshDataState(_eBook, _isLastData));
      },
    );
  }

  Future<void> _onRefreshSearchDataEBook(
      ListEBookEvent event, Emitter<ListEBookState> emit, {bool isShowLoadingCircular = false}) async {
    _isSearchMode = true;
    emit(ListEBookLoadingDataState(isShowLoadingCircular: isShowLoadingCircular));
    String searchKeyword = "";
    if (event is ListEBookRefreshSearchDataEBookEvent){
      searchKeyword = (event).searchKeyword;
    } else if (event is ListEBookRefreshSearchDataEBookShowLoadingEvent){
      searchKeyword = (event).searchKeyword;
    }
    final resultApi = await getDataEBookUsecase.execute(
        searchKeyword: searchKeyword);
    resultApi.fold(
      (failure) => emit(ListEBookFailedLoadDataState(AppStrings.errorMessage)),
      (apiResponse) {
        _setNextUrl(apiResponse.next);
        _eBook.clear();
        _eBook.addAll(apiResponse.data ?? []);
        return emit(ListEBookSuccessRefreshDataState(_eBook, _isLastData));
      },
    );
  }

  Future<void> _onLoadMoreDataEBook(
      ListEBookEvent event, Emitter<ListEBookState> emit) async {
    emit(ListEBookLoadingDataState());
    final resultApi = await getDataEBookUsecase.execute(param: _nextPage);
    resultApi.fold(
      (failure) => emit(ListEBookFailedLoadDataState(AppStrings.errorMessage)),
      (apiResponse) {
        _setNextUrl(apiResponse.next);
        _eBook.addAll(apiResponse.data ?? []);
        if (!_isSearchMode) {
          _eBookDefault.addAll(apiResponse.data ?? []);
        }
        return emit(ListEBookSuccessLoadDataState(_eBook, _isLastData));
      },
    );
  }

  Future<void> _onResetSearchMode(
      ListEBookEvent event, Emitter<ListEBookState> emit) async {
    _isSearchMode = false;
    _eBook.clear();
    _eBook.addAll(_eBookDefault);
    _isLastData = _isLastDataDefault;
    emit(ListEBookResetDataState(_eBook, _isLastData));
  }

  void _setNextUrl(String? url) {
    final String? nextUrl = url;
    _isLastData = nextUrl == null;
    if (!_isSearchMode) {
      _isLastDataDefault = _isLastData;
    }
    _nextPage = UrlHelper.extractQueryParams(nextUrl ?? "");
  }
}
