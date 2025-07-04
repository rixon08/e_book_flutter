import 'package:flutter_test/flutter_test.dart';
import 'features/e_book/presentation/blocs/list_liked_e_book_bloc/list_liked_e_book_bloc_test.dart' as likedEBook;
import 'features/e_book/presentation/blocs/detail_e_book_bloc/detail_e_book_bloc_test.dart' as detailEbook;

void main(){
  group('Liked EBook Feature', () {
    likedEBook.main();
  });
  group('Detail EBook Feature', () {
    detailEbook.main();
  });
}