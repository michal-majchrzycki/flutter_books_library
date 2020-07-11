import 'package:ebook_reader/model/objects/book_object.dart';
import '../view/books_view_output.dart';
import '../interactor/books_interactor_input.dart';

class BooksPresenter implements BooksViewOutput {

  var interactor = BooksInteractorInput();

  List<BookObject> booksArray = [];

  viewIsReady() async {

    return await interactor.getBooks();

  }

  Future<List> refreshBooks() async {

    booksArray = await interactor.getBooks();

  }

  getBooks() {

    return booksArray;

  }

  booksViewTitle() {

    return 'Flutter eBooks';
  }

  books() {

  }



}