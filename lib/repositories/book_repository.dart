import 'package:ebook_reader/model/objects/book_object.dart';
import '../model/api_connector/api_connector.dart';

class BookRepository {
  Future<List> getBooks() async {
    List<BookObject> booksArray = [];

    List<dynamic> books = await ApiConnector().getBooks();

    for (var book in books) {
      var bookObject = new BookObject(
          book.bookInfo.title,
          book.bookInfo.authors.toString(),
          book.bookInfo.cover.smallthumb,
          book.bookInfo.description,
          book.bookInfo.year,
          book.bookInfo.publisher,
          book.bookInfo.language);
      booksArray.add(bookObject);
    }

    return booksArray;
  }
}
