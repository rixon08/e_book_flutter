# 📚 Flutter E-Book App

This is a Flutter application built for a technical assessment. The app displays a list of eBooks fetched from Gutendex API, allows users to mark favorite books, and supports offline access via local storage.

## 🚀 Features
- 📖 List of eBooks from Gutendex API
- 🔍 Search eBooks by keyword
- ❤️ Mark and view favorite eBooks
- 📄 Detailed page with book cover, title, author, and summary
- 📶 Offline access using local database (Isar)
- 🔁 Pull-to-refresh to update data from API
- ✅ Unit tested with mocktail & bloc_test
- 🧱 Clean Architecture and Modular Code Structure

## 🧠 Technical Decisions
- State Management: BLoC (with flutter_bloc)
- Local Storage: Isar for offline capability
- API Access: Dio with response handling abstraction
- Testing: Unit testing with bloc_test, mocktail, flutter_test
- Clean Architecture: For testability and scalability
