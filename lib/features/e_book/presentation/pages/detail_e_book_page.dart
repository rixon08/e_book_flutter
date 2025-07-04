import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_book_flutter/core/utils/constants/app_colors.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/detail_e_book_bloc/detail_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/widgets/custom_circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailEBookPage extends StatelessWidget {
  EBookModel eBook;
  String heroTag;

  bool isLiked = false;
  bool _isLikeChanged = false;

  DetailEBookPage({required this.eBook, required this.heroTag, super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop(_isLikeChanged);
      },
      child: Scaffold(
          body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Scrollbar(
                child: ListView(
                  children: [
                    BlocListener<DetailEBookBloc, DetailEBookState>(
                      listener: (context, state) {
                        if (state is DetailEBookSuccessUpdateIsLikedData) {
                          _isLikeChanged = true;
                          isLiked = state.isLiked;
                        }
                        if (state is DetailEBookSuccessLoadIsLikedData) {
                          isLiked = state.isLiked;
                        }
                      },
                      child: BlocBuilder<DetailEBookBloc, DetailEBookState>(
                          builder: (context, state) {
                        return SizedBox(
                          height:
                              (MediaQuery.of(context).size.height * 2 / 5) + 30,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: double.infinity,
                                height: (MediaQuery.of(context).size.height *
                                    2 /
                                    5),
                                color: AppColors.primaryColor
                                    .withValues(alpha: 0.3),
                                child: Center(
                                  child: Hero(
                                      tag: heroTag,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Container(
                                          color: Colors.grey,
                                          child: CachedNetworkImage(
                                            imageUrl: eBook.imageLink,
                                            placeholder: (context, url) => SizedBox(
                                                width: 130,
                                                height: 250,
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
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsetsGeometry.only(right: 20),
                                    child: CustomCircleButton(
                                        isShowShadow: true,
                                        onTap: () {
                                          context.read<DetailEBookBloc>().add(
                                              DetailEBookSetIsLikedEBookEvent(
                                                  eBook: eBook,
                                                  isLiked: !isLiked));
                                        },
                                        child: Icon(
                                          isLiked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 50,
                                          color: isLiked
                                              ? AppColors.secondaryColor
                                              : Colors.black,
                                        ))),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            eBook.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                          Text(
                            eBook.authorNames.isNotEmpty
                                ? eBook.authorNames
                                : "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondaryColor,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download,
                                color: AppColors.secondaryColor,
                              ),
                              Text(
                                "(${eBook.downloadCountFormat})",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.summaryLabel,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    eBook.summaryText,
                                    style: TextStyle(
                                        color: AppColors.textSummaryColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  CustomCircleButton(
                      onTap: () {
                        Navigator.of(context).pop(_isLikeChanged);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
