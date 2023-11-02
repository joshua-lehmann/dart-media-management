import 'package:media_management/data/book.dart';

class BookService {
  final List<Book> _booksList = [];

  void addBook(Book book) {
    _booksList.add(book);
  }

  Future<void> addBookAsync(Book book) async {
    return Future.delayed(Duration(seconds: 1), () => _booksList.add(book));
  }

  addMultipleBooks(List<Book> books) {
    _booksList.addAll(books);
  }

  bool removeBook(Book book) {
    return _booksList.remove(book);
  }

  Future<bool> removeBookAsync(Book book) async {
    return Future.delayed(Duration(seconds: 1), () => _booksList.remove(book));
  }

  List<Book> getBooks() {
    return _booksList;
  }

  Future<List<Book>> getBooksAsync() async {
    return Future.delayed(Duration(seconds: 1), () => _booksList);
  }

  Book findBookByTitle(String title) {
    return _booksList.firstWhere((book) => book.title == title);
  }

  List<Book> findBooksByAuthor(String author) {
    return _booksList.where((book) => book.author == author).toList();
  }
}
