import 'books_interactor.dart';

class BooksInteractorInput {

  getBooks(int page) async {

    return await BooksInteractor().getBooks(page);
  }

}