import 'books_interactor_input.dart';
import '../../../repositories/book_repository.dart';

class BooksInteractor implements BooksInteractorInput {

  Future<List> getBooks(int page) async {

   return await BookRepository().getBooks(page);
  }

}