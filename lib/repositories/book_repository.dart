import 'package:ebook_reader/model/objects/book_object.dart';
import '../model/api_connector/api_connector.dart';

class BookRepository {
  Future<List> getBooks(int page) async {
    List<BookObject> booksArray = [];

    List<dynamic> books = await ApiConnector().getBooks(page);

    for (var book in books) {
      var bookObject = new BookObject(
          book.bookInfo.title,
          book.bookInfo.authors.toString().replaceAll(new RegExp('[^]*]'), ''),
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
