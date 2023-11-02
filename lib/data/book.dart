import 'package:uuid/uuid.dart';

class Book {
  final String _id;
  String title;
  String author;
  DateTime? publishedDate;

  Book(this.title, this.author, this.publishedDate) : _id = Uuid().v4();
  Book.bookWithoutDate(this.title, this.author) : _id = Uuid().v4();

  String get id => _id;

  @override
  String toString() {
    return 'title: $title, author: $author';
  }
}
