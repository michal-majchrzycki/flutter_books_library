import 'books_interactor_input.dart';
import '../../../repositories/book_repository.dart';

class BooksInteractor implements BooksInteractorInput {

  Future<List> getBooks() async {

   return await BookRepository().getBooks();
  }

}