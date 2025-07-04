import 'package:bloc_test/bloc_test.dart';
import 'package:e_book_flutter/core/network/api_response.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/e_book_repository.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/presentation/blocs/list_e_book_bloc/list_e_book_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockListEBookRepository extends Mock implements EBookRepository {}

void main() {
  late ListEBookBloc bloc;
  late MockListEBookRepository mockListEBookRepository;
  late GetDataEBookUsecase getDataEBookUsecase;

  final listEBook = [
    EBookModel(
        bookId: 1,
        title: "Book A",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
    EBookModel(
        bookId: 2,
        title: "Book B",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
  ];

  final listEBookMore = [
    EBookModel(
        bookId: 3,
        title: "Book C",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
    EBookModel(
        bookId: 4,
        title: "Book D",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
    EBookModel(
        bookId: 5,
        title: "Romeo and Juliet",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
  ];

  final listEBookforSearchBook = [
    EBookModel(
        bookId: 1,
        title: "Book A",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
    EBookModel(
        bookId: 2,
        title: "Book B",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
  ];

  final listEBookMoreforSearchBook = [
    EBookModel(
        bookId: 3,
        title: "Book C",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100),
    EBookModel(
        bookId: 4,
        title: "Book D",
        authors: [],
        summaries: [],
        translators: [],
        subjects: [],
        bookshelves: [],
        languages: [],
        copyright: false,
        imageLink: '',
        downloadCount: 100)
  ];

  final apiResponse = ApiResponse(
      count: 5,
      next: "http://gutendex.com/books/?page=2",
      previous: null,
      data: listEBook);

  final apiResponseLastData = ApiResponse(
      count: 5,
      next: null,
      previous: "http://gutendex.com/books/?page=1",
      data: listEBookMore);

  final apiResponseAllBook = ApiResponse(
      count: 5,
      next: null,
      previous: null,
      data: listEBook + listEBookMore);

  final apiResponseForSearchBook = ApiResponse(
      count: 4,
      next: "http://gutendex.com/books/?search=book&page=2",
      previous: null,
      data: listEBookforSearchBook);

  final apiResponseForSearchBookLastData = ApiResponse(
      count: 4,
      next: null,
      previous: "http://gutendex.com/books/?search=book&page=1",
      data: listEBookMoreforSearchBook);

  setUp(() {
    mockListEBookRepository = MockListEBookRepository();
    getDataEBookUsecase = GetDataEBookUsecase(mockListEBookRepository);
    bloc = ListEBookBloc(getDataEBookUsecase);
  });

  blocTest("Refresh data E-Book with Loading",
      build: () {
        when(() => mockListEBookRepository.getDataEBook())
            .thenAnswer((_) async {
          return apiResponse;
        });
        return bloc;
      },
      act: (bloc) => bloc.add(ListEBookRefreshDataEBookShowLoadingEvent()),
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: true),
            ListEBookSuccessRefreshDataState(listEBook, false)
          ]);

  blocTest("Error Refresh data E-Book with Loading",
      build: () {
        when(() => mockListEBookRepository.getDataEBook())
            .thenThrow((_) async {
          throwsException;
        });
        return bloc;
      },
      act: (bloc) => bloc.add(ListEBookRefreshDataEBookShowLoadingEvent()),
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: true),
            ListEBookFailedLoadDataState(AppStrings.errorMessage)
          ]);

  blocTest("Refresh data E-Book from SmartRefresher",
      build: () {
        when(() => mockListEBookRepository.getDataEBook())
            .thenAnswer((_) async {
          return apiResponse;
        });
        return bloc;
      },
      act: (bloc) => bloc.add(ListEBookRefreshDataEBookEvent()),
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: false),
            ListEBookSuccessRefreshDataState(listEBook, false)
          ]);

  blocTest("Load More data E-Book with Loading",
      build: () {
        when(() => mockListEBookRepository.getDataEBook())
            .thenAnswer((_) async {
          return apiResponse;
        });
        when(() => mockListEBookRepository.getDataEBook(param: "?page=2"))
            .thenAnswer((_) async {
          return apiResponseLastData;
        });
        return bloc;
      },
      act: (bloc) async {
        bloc.add(ListEBookRefreshDataEBookEvent());
        bloc.add(ListEBookLoadMoreDataEBookEvent());
      },
      skip: 2,
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: false),
            ListEBookSuccessLoadDataState(listEBook + listEBookMore, true)
          ]);


    blocTest("Refresh data Search E-Book with Loading",
      build: () {
        when(() => mockListEBookRepository.getDataEBook(searchKeyword: "book"))
            .thenAnswer((_) async {
          return apiResponseForSearchBook;
        });
        return bloc;
      },
      act: (bloc) => bloc.add(ListEBookRefreshSearchDataEBookShowLoadingEvent("book")),
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: true),
            ListEBookSuccessRefreshDataState(listEBookforSearchBook, false)
          ]);

  blocTest("Refresh data Search E-Book from SmartRefresher",
      build: () {
        when(() => mockListEBookRepository.getDataEBook(searchKeyword: "book"))
            .thenAnswer((_) async {
          return apiResponseForSearchBook;
        });
        return bloc;
      },
      act: (bloc) => bloc.add(ListEBookRefreshSearchDataEBookEvent("book")),
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: false),
            ListEBookSuccessRefreshDataState(listEBookforSearchBook, false)
          ]);

  blocTest("Load More Search data E-Book with Loading",
      build: () {
        when(() => mockListEBookRepository.getDataEBook(searchKeyword: "book"))
            .thenAnswer((_) async {
          return apiResponseForSearchBook;
        });
        when(() => mockListEBookRepository.getDataEBook(param: "?search=book&page=2"))
            .thenAnswer((_) async {
          return apiResponseForSearchBookLastData;
        });
        return bloc;
      },
      act: (bloc) async {
        bloc.add(ListEBookRefreshSearchDataEBookEvent("book"));
        await Future.delayed(Duration.zero);
        bloc.add(ListEBookLoadMoreSearchDataEBookEvent());
      },
      skip: 2,
      expect: () => <ListEBookState>[
            ListEBookLoadingDataState(isShowLoadingCircular: false),
            ListEBookSuccessLoadDataState(listEBookforSearchBook + listEBookMoreforSearchBook, true)
          ]);


    blocTest("Reset Search mode",
      build: () {
        when(() => mockListEBookRepository.getDataEBook())
            .thenAnswer((_) async {
          return apiResponseAllBook;
        });
        when(() => mockListEBookRepository.getDataEBook(searchKeyword: "book"))
            .thenAnswer((_) async {
          return apiResponseForSearchBook;
        });
        return bloc;
      },
      act: (bloc) async { 
        bloc.add(ListEBookRefreshDataEBookEvent());
        bloc.add(ListEBookRefreshSearchDataEBookEvent("book"));
        bloc.add(ListEBookResetSearchModeEvent());
      },
      skip: 4,
      expect: () => <ListEBookState>[
            ListEBookResetDataState(listEBook + listEBookMore, true)
          ]);
}
