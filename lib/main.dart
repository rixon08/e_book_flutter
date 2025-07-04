import 'package:e_book_flutter/core/utils/constants/app_colors.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/core/utils/injection.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_e_book_bloc/list_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_liked_e_book_bloc/list_liked_e_book_bloc.dart';
import 'package:e_book_flutter/features/e_book/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:e_book_flutter/features/e_book/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => ClassicHeader(),
      footerBuilder: () => ClassicFooter(),
      headerTriggerDistance: 80.0,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => HomeCubit(),
            ),
            BlocProvider(
                create: ((_) => ListEBookBloc(getIt())
                  ..add(ListEBookRefreshDataEBookShowLoadingEvent()))),
            BlocProvider(
                create: ((_) =>
                    ListLikedEBookBloc(getDataLikedEBookUsecase: getIt())
                      ..add(ListLikedEBookRefreshDataShowLoadingEvent()))),
          ],
          child: HomePage(),
        ),
      ),
    );
  }
}
