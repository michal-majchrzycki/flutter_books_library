import '../view/book_view_output.dart';

class BookPresenter implements BookViewOutput {

  bookTitle() {

    return 'Some Book Title';
  }

  bookAuthor() {

    return 'Some Book Author';
  }

  bookDescription() {
    return 'TMaire Brennan mieszka w Dublinie, w Irlandii. Często podróżuje angażując się w działalność organizacji charytatywnych. Jest ambasadorem ';
  }

  bookYear() {

    return 'Year: 1990';
  }

  bookPublisher() {

    return 'Publisher: Penguin Books';
  }

  bookLanguage() {

    return 'Language: English';
  }

}