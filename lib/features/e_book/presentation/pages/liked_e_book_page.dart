import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/core/utils/constants/hero_tag.dart';
import 'package:e_book_flutter/core/utils/injection.dart';
import 'package:e_book_flutter/features/e_book/data/helpers/hero_tag_helper.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/detail_e_book_bloc/detail_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_liked_e_book_bloc/list_liked_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/pages/detail_e_book_page.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/custom_list_e_book.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class LikedEBookPage extends StatefulWidget {
  const LikedEBookPage({super.key});

  @override
  State<LikedEBookPage> createState() => _LikedEBookPageState();
}

class _LikedEBookPageState extends State<LikedEBookPage> {
  List<EBookModel> _listEBook = [];

  TextEditingController _textController = TextEditingController();

  bool _isShowLoadingCircular = false;
  bool _isShowError = false;
  bool _isSearchMode = false;
  final String _heroTag = HeroTag.listLikedEBookImageTag;

  String _errorMessage = "";

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<ListLikedEBookBloc, ListLikedEBookState>(
      listener: (context, state) {
        _isShowError = false;
        _isShowLoadingCircular = false;
        if (state is ListLikedEBookLoadingDataState) {
          _isShowLoadingCircular = state.isShowLoadingCircular;
        } else if (state is ListLikedEBookFailedLoadDataState) {
          _isShowError = true;
          _errorMessage = state.errorMessage;
        }
      },
      child: BlocBuilder<ListLikedEBookBloc, ListLikedEBookState>(
          builder: (context, state) {
        if (state is ListLikedEBookSuccessRefreshDataState) {
          _listEBook = state.eBook;
          _refreshController.refreshCompleted();
          _refreshController.resetNoData();
        } else if (state is ListLikedEBookResetDataState) {
          _listEBook = state.eBook;
          _textController.text = "";
          _refreshController.resetNoData();
        }
        _refreshController.loadNoData();
        return CustomListEBook(
            title: AppStrings.listLikedEBookLabel,
            isWithConnectionStatus: false,
            textEditingController: _textController,
            onSearchChanged: (searchKeyword) {
              if (searchKeyword.isEmpty) {
                _isSearchMode = false;
                context
                    .read<ListLikedEBookBloc>()
                    .add(ListLikedEBookResetSearchModeEvent());
              }
            },
            onSearchSubmitted: (searchKeyword) {
              _isSearchMode = true;
              context.read<ListLikedEBookBloc>().add(
                  ListLikedEBookRefreshSearchDataShowLoadingEvent(
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
            onClickEBook: (ctx, pos) async {
              final result = await Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (_) => DetailEBookBloc(
                                getDataIsLikedEBookUsecase: getIt(),
                                setLikeEBookUsecase: getIt())
                              ..add(DetailEBookFromLikedEBookEvent(
                                  _listEBook[pos])),
                            child: DetailEBookPage(
                              eBook: _listEBook[pos],
                              heroTag: HeroTagHelper.formatTag(
                                  id: _listEBook[pos].bookId,
                                  heroTag: _heroTag),
                            ),
                          )));

              if (result) {
                if (context.mounted) {
                  context
                      .read<ListLikedEBookBloc>()
                      .add(ListLikedEBookRefreshDataShowLoadingEvent());
                }
              }
            },
            heroTag: _heroTag,
            onRefreshButtonWhenError: () {
              context
                  .read<ListLikedEBookBloc>()
                  .add(ListLikedEBookRefreshDataShowLoadingEvent());
            },
            errorMessage: _errorMessage);
      }),
    );
  }

  void _onRefresh(BuildContext context) async {
    context.read<ListLikedEBookBloc>().add(!_isSearchMode
        ? ListLikedEBookRefreshDataEvent()
        : ListLikedEBookRefreshSearchDataEvent(_textController.text));
  }

  void _onLoading(BuildContext context) async {
    //context.read<ListLikedEBookBloc>().add(ListLikedEBookLoadMoreDataEvent());
  }
}
