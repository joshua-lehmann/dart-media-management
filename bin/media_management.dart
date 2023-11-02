import 'dart:io';

import 'package:media_management/data/book.dart';
import 'package:media_management/service/book_service.dart';

void main(List<String> arguments) {
  BookService bookService = BookService();

  print("Welcome to the Media Management App");
  while (true) {
    print("Choose an action:");
    print("1. Add a book");
    print("2. Remove a book");
    print("3. View all books");
    print("4. Search for books by author");
    print("5. Exit");
    print("Enter your choice (1/2/3/4): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("Enter the title of the book to add:");
        var title = stdin.readLineSync();
        print("Enter the author of the book to add:");
        var author = stdin.readLineSync();
        bookService.addBook(Book.bookWithoutDate(title!, author!));
        print("$title has been added to the library.");
        break;
      case '2':
        print("Enter the title of the book to remove:");
        var bookTitleToRemove = stdin.readLineSync();
        Book bookToRemove;
        try {
          bookToRemove = bookService.findBookByTitle(bookTitleToRemove!);
        } catch (e) {
          print("Book '$bookTitleToRemove' not found in the library.");
          break;
        }
        bookService.removeBook(bookToRemove);
        print("$bookToRemove has been removed from the library.");
        break;
      case '3':
        if (bookService.getBooks().isEmpty) {
          print("The library is empty!");
        } else {
          print("Books in the library:");
          var books = bookService.getBooks();
          for (var book in books) {
            print(book);
          }
        }
        break;
      case '4':
        print("Type the name of the author to search for:");
        var author = stdin.readLineSync();
        try {
          var books = bookService.findBooksByAuthor(author!);
          print("Books by $author:");
          for (var book in books) {
            print(book);
          }
        } catch (e) {
          print("No books found for author '$author'.");
          break;
        }
        break;
      case '5':
        print("Goodbye!");
        exit(0);
      default:
        print("Invalid choice. Please enter 1, 2, 3, or 4.");
        break;
    }
  }
}
