import '../presenter/book_presenter.dart';

class BookViewOutput {

  bookTitle() async {

    return await BookPresenter().bookTitle();
  }

  noBookTitle() {

    return BookPresenter().noBookTitle();
  }

  bookAuthor() async {

    return await BookPresenter().bookAuthor();
  }

  noBookAuthor() {

    return BookPresenter().noBookAuthor();
  }

  bookDescription() async {

    return await BookPresenter().bookDescription();
  }

  noBookDescription() {

    return BookPresenter().noBookDescription();
  }

  bookYear() async {
    return await BookPresenter().bookYear();
  }

  noBookYear() {

    return BookPresenter().noBookYear();
  }

  bookPublisher() async {

    return await BookPresenter().bookPublisher();
  }

  noBookPublisher() {

    return BookPresenter().noBookPublisher();
  }

  bookLanguage() async {

    return await BookPresenter().bookLanguage();
  }

  noBookLanguage() {

    return BookPresenter().noBookLanguage();
  }

  bookImage() async {

    return await BookPresenter().bookImage();
  }

}