import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_flutter/core/utils/constants/app_colors.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/features/e_book/data/helpers/hero_tag_helper.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/connection_status.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/custom_search.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/shimmer_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomListEBook extends StatelessWidget {
  final void Function(String) onSearchChanged;
  final void Function(String) onSearchSubmitted;
  final void Function() onRefresh;
  final void Function() onLoading;
  final void Function() onRefreshButtonWhenError;
  final void Function(BuildContext, int) onClickEBook;
  final bool isShowLoadingCircular;
  final bool isShowError;
  final bool isWithConnectionStatus;
  final String heroTag;
  final String errorMessage;
  final String title;
  final RefreshController refreshController;
  final TextEditingController textEditingController;
  final List<EBookModel> listEBook;

  CustomListEBook(
      {required this.title,
      required this.isWithConnectionStatus,
      required this.textEditingController,
      required this.onSearchChanged,
      required this.onSearchSubmitted,
      required this.isShowLoadingCircular,
      required this.isShowError,
      required this.onRefresh,
      required this.onLoading,
      required this.refreshController,
      required this.listEBook,
      required this.onClickEBook,
      required this.heroTag,
      required this.onRefreshButtonWhenError,
      required this.errorMessage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              CustomSearch(
                controller: textEditingController,
                onChanged: onSearchChanged,
                onSubmitted: (searchKeyword) {
                  if (searchKeyword.isNotEmpty) {
                    onSearchSubmitted(searchKeyword);
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child:
              // isShowLoadingCircular
              //     ? Center(
              //         child: SizedBox(
              //             width: 50,
              //             height: 50,
              //             child: CircularProgressIndicator()),
              //       )
              //     :
              Stack(
            children: [
              Scrollbar(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: onRefresh,
                  onLoading: onLoading,
                  footer: CustomFooter(
                    builder: (context, mode) {
                      Widget? body;
                      if (mode == LoadStatus.loading ||
                          mode == LoadStatus.canLoading) {
                        body = CupertinoActivityIndicator();
                      }
                      return Visibility(
                        visible: body != null,
                        child: SizedBox(
                          height: 55.0,
                          child: Center(child: body),
                        ),
                      );
                    },
                  ),
                  child: isShowLoadingCircular
                      ? ShimmerLoading()
                      : ListView.builder(
                          itemCount: listEBook.length,
                          itemBuilder: (context, pos) {
                            return Material(
                              child: InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  onClickEBook(context, pos);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: Center(
                                          child: Hero(
                                            tag: HeroTagHelper.formatTag(
                                                id: listEBook[pos].bookId,
                                                heroTag: heroTag),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: CachedNetworkImage(
                                                height: 150,
                                                imageUrl:
                                                    listEBook[pos].imageLink,
                                                placeholder: (context, url) =>
                                                    SizedBox(
                                                        width: 130,
                                                        height: 150,
                                                        child: Center(
                                                            child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator()))),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listEBook[pos].title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                listEBook[pos]
                                                        .authorNames
                                                        .isNotEmpty
                                                    ? listEBook[pos].authorNames
                                                    : "-",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors
                                                        .textSecondaryColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.download,
                                                    color: AppColors
                                                        .secondaryColor,
                                                  ),
                                                  Text(
                                                    "(${listEBook[pos].downloadCountFormat})",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .secondaryColor),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(listEBook[pos].summaryText,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors
                                                        .textSummaryColor,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              ),
              if (!isShowError && listEBook.isEmpty)
                Center(
                  child: Text(AppStrings.noData,
                      style: TextStyle(
                        color: AppColors.textSecondaryColor,
                      )),
                ),
              if (isShowError)
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: onRefreshButtonWhenError,
                          icon: Icon(
                            Icons.refresh,
                            size: 30,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
        if (isWithConnectionStatus) ConnectionStatus()
      ],
    );
  }
}
