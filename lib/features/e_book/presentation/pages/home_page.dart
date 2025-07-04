import 'package:e_book_flutter/core/utils/constants/app_colors.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_liked_e_book_bloc/list_liked_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:e_book_flutter/features/e_book/presentation/pages/liked_e_book_page.dart';
import 'package:e_book_flutter/features/e_book/presentation/pages/list_e_book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(builder: (context, index) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: index,
              children: [ListEBookPage(), LikedEBookPage()],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            iconSize: 30,
            selectedItemColor: AppColors.primaryColor,
            selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.list, color: AppColors.primaryColor,),
                  icon: Icon(Icons.list), label: AppStrings.listEBookLabel),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite, color: AppColors.primaryColor),
                  icon: Icon(Icons.favorite), label: AppStrings.listLikedEBookLabel)
            ],
            onTap: (pos) {
              context.read<HomeCubit>().selectTab(pos);
              if (index != 1 &&pos == 1) {
                context
                    .read<ListLikedEBookBloc>()
                    .add(ListLikedEBookRefreshDataShowLoadingEvent());
              }else if (index != 0 && pos == 0){
                context
                    .read<ListLikedEBookBloc>()
                    .add(ListLikedEBookResetSearchModeEvent());
              }
            },
          ),
        );
      }
    );
  }
}
