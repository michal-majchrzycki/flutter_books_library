import '../presenter/books_presenter.dart';

class BooksViewOutput {

  viewIsReady() async {

    return await BooksPresenter().viewIsReady();

  }

  booksViewTitle() {

    return BooksPresenter().booksViewTitle();

  }

  getBooks() {

    return BooksPresenter().getBooks();
  }

}