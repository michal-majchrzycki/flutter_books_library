import '../../../model/objects/book_object.dart';
import '../view/book_view_output.dart';
import 'book_presenter_input.dart';

class BookPresenter implements BookViewOutput, BookPresenterInput {

  static BookObject selectedBook;

  setBook(BookObject book) async {

    selectedBook = book;

  }

  bookTitle() async {

    return await selectedBook.title;
  }

  bookAuthor() async {

    return await selectedBook.author;
  }

  bookDescription() async {
    return await selectedBook.description;
  }

  bookYear() async {

    return await selectedBook.year;
  }

  bookPublisher() async {

    return await selectedBook.publisher;
  }

  bookLanguage() async {

    return await selectedBook.language;
  }

  bookImage() async {

    return await selectedBook.cover;
  }

  // MARK: No data placeholders:

  noBookTitle() {

    return 'No title';
  }

  noBookAuthor() {

    return 'No author';
  }

  noBookYear() {

    return 'No year';
  }

  noBookPublisher() {

    return 'No publisher';
  }

  noBookLanguage() {

    return 'No language';
  }

  noBookDescription() {

    return 'No description';
  }

}