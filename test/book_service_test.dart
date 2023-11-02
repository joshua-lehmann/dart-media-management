import 'package:media_management/data/book.dart';
import 'package:media_management/service/book_service.dart';
import 'package:test/test.dart';

void main() {
  Book book1 =
      Book("To Kill a Mockingbird", "Harper Lee", DateTime(1960, 7, 11));
  Book book2 = Book("1984", "George Orwell", DateTime(1949, 6, 8));
  Book book3 =
      Book("The Great Gatsby", "F. Scott Fitzgerald", DateTime(1925, 4, 10));
  Book book4 =
      Book("Pride and Prejudice", "Jane Austen", DateTime(1813, 1, 28));
  Book book5 =
      Book("The Catcher in the Rye", "J.D. Salinger", DateTime(1951, 7, 16));
  Book book6 =
      Book("Lord of the Flies", "William Golding", DateTime(1954, 9, 17));
  Book book7 = Book("The Hobbit", "J.R.R. Tolkien", DateTime(1937, 9, 21));
  Book book8 =
      Book("The Hunger Games", "Suzanne Collins", DateTime(2008, 9, 14));
  Book book9 =
      Book("To Kill a Mockingbird", "Harper Lee", DateTime(1960, 7, 11));
  Book book10 = Book("1984", "George Orwell", DateTime(1949, 6, 8));

  group('BookService Tests', () {
    late BookService bookService;

    setUp(() {
      bookService = BookService();
    });

    test('addBook', () {
      bookService.addBook(book1);
      bookService.addBook(book2);
      expect(bookService.getBooks().length, 2);
    });

    test('removeBook', () {
      BookService bookService = BookService();
      bookService.addBook(book1);
      bookService.addBook(book2);
      expect(bookService.removeBook(book1), true);
      expect(bookService.getBooks().length, 1);
    });

    test('addMultipleBooks', () {
      bookService.addMultipleBooks([
        book1,
        book2,
        book3,
        book4,
        book5,
        book6,
        book7,
        book8,
        book9,
        book10
      ]);
      expect(bookService.getBooks().length, 10);
    });

    test("findBookByTitle", () {
      bookService.addMultipleBooks([
        book1,
        book2,
        book3,
        book4,
        book5,
        book6,
        book7,
        book8,
        book9,
        book10
      ]);
      expect(bookService.findBookByTitle("1984"), book2);
    });

    test("findBooksByAuthor", () {
      bookService.addMultipleBooks([
        book1,
        book2,
        book3,
        book4,
        book5,
        book6,
        book7,
        book8,
        book9,
        book10
      ]);
      expect(bookService.findBooksByAuthor("Harper Lee"), [book1, book9]);
    });
  });
}
