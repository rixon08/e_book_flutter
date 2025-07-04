import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/core/utils/constants/hero_tag.dart';
import 'package:e_book_flutter/core/utils/injection.dart';
import 'package:e_book_flutter/features/e_book/data/helpers/hero_tag_helper.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/detail_e_book_bloc/detail_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_e_book_bloc/list_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/pages/detail_e_book_page.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/connection_status.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/custom_list_e_book.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ListEBookPage extends StatefulWidget {
  const ListEBookPage({super.key});

  @override
  State<ListEBookPage> createState() => _ListEBookPageState();
}

class _ListEBookPageState extends State<ListEBookPage> {

  List<EBookModel> _listEBook = [];

  TextEditingController _textController = TextEditingController();

  bool _isShowLoadingCircular = false;
  bool _isShowError = false;
  bool _isSearchMode = false;

  String _errorMessage = "";

  final String _heroTag = HeroTag.listEBookImageTag;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);


  @override
  Widget build(BuildContext context) {
    return BlocListener<ListEBookBloc, ListEBookState>(
      listener: (context, state) {
        _isShowError = false;
        _isShowLoadingCircular = false;
        if (state is ListEBookLoadingDataState) {
          _isShowLoadingCircular = state.isShowLoadingCircular;
        } else if (state is ListEBookFailedLoadDataState) {
          _isShowError = true;
          _errorMessage = state.errorMessage;
        }
      },
      child:
          BlocBuilder<ListEBookBloc, ListEBookState>(builder: (context, state) {
        if (state is ListEBookSuccessRefreshDataState) {
          _listEBook = state.eBook;
          _refreshController.refreshCompleted();
          _refreshController.resetNoData();
          if (state.isLastData) {
            _refreshController.loadNoData();
          }
        } else if (state is ListEBookSuccessLoadDataState) {
          _listEBook = state.eBook;
          _refreshController.loadComplete();
          if (state.isLastData) {
            _refreshController.loadNoData();
          }
        } else if (state is ListEBookResetDataState) {
          _listEBook = state.eBook;
          _refreshController.resetNoData();
          if (state.isLastData) {
            _refreshController.loadNoData();
          }
        }
        return CustomListEBook(
            title: AppStrings.listEBookLabel,
            isWithConnectionStatus: true,
            textEditingController: _textController,
            onSearchChanged: (searchKeyword) {
              if (searchKeyword.isEmpty) {
                _isSearchMode = false;
                context
                    .read<ListEBookBloc>()
                    .add(ListEBookResetSearchModeEvent());
              }
            },
            onSearchSubmitted: (searchKeyword) {
              _isSearchMode = true;
              context.read<ListEBookBloc>().add(
                  ListEBookRefreshSearchDataEBookShowLoadingEvent(
                      searchKeyword));
            },
            isShowLoadingCircular: _isShowLoadingCircular,
            isShowError: _isShowError,
            onRefresh: () {
              _onRefresh(context);
            },
            onLoading: () {
              _onLoading(context);
            },
            refreshController: _refreshController,
            listEBook: _listEBook,
            onClickEBook: (context, pos) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (_) => DetailEBookBloc(
                                getDataIsLikedEBookUsecase: getIt(),
                                setLikeEBookUsecase: getIt())
                              ..add(DetailEBookFromListEBookEvent(
                                  _listEBook[pos])),
                            child: DetailEBookPage(
                              eBook: _listEBook[pos],
                              heroTag: HeroTagHelper.formatTag(
                                  id: _listEBook[pos].bookId,
                                  heroTag: _heroTag),
                            ),
                          )));
            },
            heroTag: _heroTag,
            onRefreshButtonWhenError: () {
              context
                  .read<ListEBookBloc>()
                  .add(ListEBookRefreshDataEBookShowLoadingEvent());
            },
            errorMessage: _errorMessage);
      }),
    );
  }

  void _onRefresh(BuildContext context) async {
    context.read<ListEBookBloc>().add(!_isSearchMode
        ? ListEBookRefreshDataEBookEvent()
        : ListEBookRefreshSearchDataEBookEvent(_textController.text));
  }

  void _onLoading(BuildContext context) async {
    context.read<ListEBookBloc>().add(ListEBookLoadMoreDataEBookEvent());
  }
}


class ListEBookPage1 extends StatelessWidget {
  List<EBookModel> _listEBook = [];

  TextEditingController _textController = TextEditingController();

  bool _isShowLoadingCircular = false;
  bool _isShowError = false;
  bool _isSearchMode = false;

  String _errorMessage = "";

  final String _heroTag = HeroTag.listEBookImageTag;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ListEBookPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListEBookBloc, ListEBookState>(
      listener: (context, state) {
        _isShowError = false;
        _isShowLoadingCircular = false;
        if (state is ListEBookLoadingDataState) {
          _isShowLoadingCircular = state.isShowLoadingCircular;
        } else if (state is ListEBookFailedLoadDataState) {
          _isShowError = true;
          _errorMessage = state.errorMessage;
        }
      },
      child:
          BlocBuilder<ListEBookBloc, ListEBookState>(builder: (context, state) {
        if (state is ListEBookSuccessRefreshDataState) {
          _listEBook = state.eBook;
          _refreshController.refreshCompleted();
          _refreshController.resetNoData();
          if (state.isLastData) {
            _refreshController.loadNoData();
          }
        } else if (state is ListEBookSuccessLoadDataState) {
          _listEBook = state.eBook;
          _refreshController.loadComplete();
          if (state.isLastData) {
            _refreshController.loadNoData();
          }
        } else if (state is ListEBookResetDataState) {
          _listEBook = state.eBook;
          _refreshController.resetNoData();
          if (state.isLastData) {
            _refreshController.loadNoData();
          }
        }
        return CustomListEBook(
            title: AppStrings.listEBookLabel,
            isWithConnectionStatus: true,
            textEditingController: _textController,
            onSearchChanged: (searchKeyword) {
              if (searchKeyword.isEmpty) {
                _isSearchMode = false;
                context
                    .read<ListEBookBloc>()
                    .add(ListEBookResetSearchModeEvent());
              }
            },
            onSearchSubmitted: (searchKeyword) {
              _isSearchMode = true;
              context.read<ListEBookBloc>().add(
                  ListEBookRefreshSearchDataEBookShowLoadingEvent(
                      searchKeyword));
            },
            isShowLoadingCircular: _isShowLoadingCircular,
            isShowError: _isShowError,
            onRefresh: () {
              _onRefresh(context);
            },
            onLoading: () {
              _onLoading(context);
            },
            refreshController: _refreshController,
            listEBook: _listEBook,
            onClickEBook: (context, pos) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (_) => DetailEBookBloc(
                                getDataIsLikedEBookUsecase: getIt(),
                                setLikeEBookUsecase: getIt())
                              ..add(DetailEBookFromListEBookEvent(
                                  _listEBook[pos])),
                            child: DetailEBookPage(
                              eBook: _listEBook[pos],
                              heroTag: HeroTagHelper.formatTag(
                                  id: _listEBook[pos].bookId,
                                  heroTag: _heroTag),
                            ),
                          )));
            },
            heroTag: _heroTag,
            onRefreshButtonWhenError: () {
              context
                  .read<ListEBookBloc>()
                  .add(ListEBookRefreshDataEBookShowLoadingEvent());
            },
            errorMessage: _errorMessage);
      }),
    );
  }

  void _onRefresh(BuildContext context) async {
    context.read<ListEBookBloc>().add(!_isSearchMode
        ? ListEBookRefreshDataEBookEvent()
        : ListEBookRefreshSearchDataEBookEvent(_textController.text));
  }

  void _onLoading(BuildContext context) async {
    context.read<ListEBookBloc>().add(ListEBookLoadMoreDataEBookEvent());
  }
}
