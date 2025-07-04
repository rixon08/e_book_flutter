import 'package:bloc/bloc.dart';


class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void selectTab(int index) => emit(index);
}
