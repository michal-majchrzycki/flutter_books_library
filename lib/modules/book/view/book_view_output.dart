import '../presenter/book_presenter.dart';

class BookViewOutput {

  bookTitle() {

    return BookPresenter().bookTitle();
  }

  bookAuthor() {

    return BookPresenter().bookAuthor();
  }

  bookDescription() {

    return BookPresenter().bookDescription();
  }

  bookYear() {
    return BookPresenter().bookYear();
  }

  bookPublisher() {

    return BookPresenter().bookPublisher();
  }

  bookLanguage() {

    return BookPresenter().bookLanguage();
  }

}