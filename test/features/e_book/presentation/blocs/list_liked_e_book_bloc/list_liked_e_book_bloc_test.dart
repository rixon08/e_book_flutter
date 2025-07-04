import 'package:bloc_test/bloc_test.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_liked_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_liked_e_book_bloc/list_liked_e_book_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLikedEBookRepository extends Mock implements LikedEBookRepository {}

void main() {
  late ListLikedEBookBloc bloc;
  late MockLikedEBookRepository mockLikedEBookRepository;
  late GetDataLikedEBookUsecase getDataLikedEBookUsecase;

  final likedBooks = [
    EBookModel(bookId: 1, title: "Book A", authors: [], summaries: [], translators: [], subjects: [], bookshelves: [], languages: [], copyright: false, imageLink: '', downloadCount: 100),
    EBookModel(bookId: 2, title: "Book B", authors: [], summaries: [], translators: [], subjects: [], bookshelves: [], languages: [], copyright: false, imageLink: '', downloadCount: 100),
  ];

  final likedBooksSearchA = [
    EBookModel(bookId: 1, title: "Book A", authors: [], summaries: [], translators: [], subjects: [], bookshelves: [], languages: [], copyright: false, imageLink: '', downloadCount: 100),
  ];

  setUp((){
    mockLikedEBookRepository = MockLikedEBookRepository();
    getDataLikedEBookUsecase = GetDataLikedEBookUsecase(mockLikedEBookRepository);
    bloc = ListLikedEBookBloc(getDataLikedEBookUsecase: getDataLikedEBookUsecase);
  });
  
  blocTest<ListLikedEBookBloc, ListLikedEBookState>(
    'Load data liked E-Book with Loading',
    build: () {
      when(() => mockLikedEBookRepository.getDataLikedEBook()).thenAnswer((_) async => likedBooks);
      return bloc;
    },
    act: (bloc) => bloc.add(ListLikedEBookRefreshDataShowLoadingEvent()),
    expect: () => <ListLikedEBookState>[
      ListLikedEBookLoadingDataState(isShowLoadingCircular: true),
      ListLikedEBookSuccessRefreshDataState(likedBooks,false)
      ],
  );

  blocTest<ListLikedEBookBloc, ListLikedEBookState>(
    'Refresh data liked E-Book from SmartRefresher',
    build: () {
      when(() => mockLikedEBookRepository.getDataLikedEBook()).thenAnswer((_) async => likedBooks);
      return bloc;
    },
    act: (bloc) => bloc.add(ListLikedEBookRefreshDataEvent()),
    expect: () => <ListLikedEBookState>[
      ListLikedEBookLoadingDataState(isShowLoadingCircular: false),
      ListLikedEBookSuccessRefreshDataState(likedBooks,false)
      ],
  );

  blocTest<ListLikedEBookBloc, ListLikedEBookState>(
    'Search data liked E-Book',
    build: () {
      when(() => mockLikedEBookRepository.getDataLikedEBook(searchKeyword: "Book A")).thenAnswer((_) async => likedBooksSearchA);
      return bloc;
    },
    act: (bloc) => bloc.add(ListLikedEBookRefreshSearchDataShowLoadingEvent("Book A")),
    expect: () => <ListLikedEBookState>[
      ListLikedEBookLoadingDataState(isShowLoadingCircular: true),
      ListLikedEBookSuccessRefreshDataState(likedBooksSearchA,false)
      ],
  );


  blocTest<ListLikedEBookBloc, ListLikedEBookState>(
    'Refresh Search data liked E-Book',
    build: () {
      when(() => mockLikedEBookRepository.getDataLikedEBook(searchKeyword: "Book A")).thenAnswer((_) async => likedBooksSearchA);
      return bloc;
    },
    act: (bloc) => bloc.add(ListLikedEBookRefreshSearchDataEvent("Book A")),
    expect: () => <ListLikedEBookState>[
      ListLikedEBookLoadingDataState(isShowLoadingCircular: false),
      ListLikedEBookSuccessRefreshDataState(likedBooksSearchA,false)
      ],
  );

  blocTest<ListLikedEBookBloc, ListLikedEBookState>(
    'Reset Search mode',
    build: () {
      when(() => mockLikedEBookRepository.getDataLikedEBook()).thenAnswer((_) async => likedBooks);
      return bloc;
    },
    act: (bloc) async {
      bloc.add(ListLikedEBookRefreshDataEvent());
      await Future.delayed(Duration.zero);
      bloc.add(ListLikedEBookResetSearchModeEvent());
    },
    expect: () => <ListLikedEBookState>[
      ListLikedEBookLoadingDataState(isShowLoadingCircular: false),
      ListLikedEBookSuccessRefreshDataState(likedBooks,false),
      ListLikedEBookResetDataState(likedBooks, false)
      ],
  );


}