import 'package:media_management/data/book.dart';

class BookService {
  final List<Book> _booksList = [];

  addBook(Book book) {
    _booksList.add(book);
  }

  addMultipleBooks(List<Book> books) {
    _booksList.addAll(books);
  }

  bool removeBook(Book book) {
    return _booksList.remove(book);
  }

  List<Book> getBooks() {
    return _booksList;
  }

  Book findBookByTitle(String title) {
    return _booksList.firstWhere((book) => book.title == title);
  }

  List<Book> findBooksByAuthor(String author) {
    return _booksList.where((book) => book.author == author).toList();
  }

}
