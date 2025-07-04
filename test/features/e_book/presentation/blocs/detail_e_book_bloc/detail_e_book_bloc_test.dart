import 'package:bloc_test/bloc_test.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_is_liked_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/set_like_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/detail_e_book_bloc/detail_e_book_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLikedEBookRepository extends Mock implements LikedEBookRepository{}
void main() {
  late MockLikedEBookRepository mockLikedEBookRepository;
  late DetailEBookBloc bloc;
  late GetDataIsLikedEBookUsecase getDataIsLikedEBookUsecase;
  late SetLikeEBookUsecase setLikeEBookUsecase;

  final EBookModel eBookData = EBookModel(bookId: 1, title: "Book A", authors: [], summaries: [], translators: [], subjects: [], bookshelves: [], languages: [], copyright: false, imageLink: '', downloadCount: 100);
  setUp((){
    mockLikedEBookRepository = MockLikedEBookRepository();
    getDataIsLikedEBookUsecase = GetDataIsLikedEBookUsecase(mockLikedEBookRepository);
    setLikeEBookUsecase = SetLikeEBookUsecase(mockLikedEBookRepository);
    bloc = DetailEBookBloc(getDataIsLikedEBookUsecase: getDataIsLikedEBookUsecase, setLikeEBookUsecase: setLikeEBookUsecase);
  });

  blocTest<DetailEBookBloc, DetailEBookState>(
    "Get Data Liked E-Book From List E-Book", 
    build: () {
      when(() => mockLikedEBookRepository.isLikedEBook(eBookData.bookId)).thenAnswer((_) async => true);
      return bloc;

  }, act: (bloc) => bloc.add(DetailEBookFromListEBookEvent(eBookData)),
  expect: () => <DetailEBookState>[
    DetailEBookSuccessLoadIsLikedData(true)
  ]);

  blocTest<DetailEBookBloc, DetailEBookState>(
    "Get Data Liked E-Book From List Liked E-Book", 
    build: () {
      return bloc;

  }, act: (bloc) => bloc.add(DetailEBookFromLikedEBookEvent(eBookData)),
  expect: () => <DetailEBookState>[
    DetailEBookSuccessLoadIsLikedData(true)
  ]);

  blocTest<DetailEBookBloc, DetailEBookState>(
    "Set Liked E-Book", 
    build: () {
      when(() => mockLikedEBookRepository.setIsLikedEBook(bookId: eBookData.bookId, isLiked: false)).thenAnswer((_) async => true);
      return bloc;

  }, act: (bloc) => bloc.add(DetailEBookSetIsLikedEBookEvent(eBook: eBookData, isLiked: false)),
  expect: () => <DetailEBookState>[
    DetailEBookSuccessLoadIsLikedData(false)
  ]);
}