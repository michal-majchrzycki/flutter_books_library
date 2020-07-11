import 'books_interactor.dart';

class BooksInteractorInput {

  getBooks() async {

    return await BooksInteractor().getBooks();
  }

}