import 'package:ebook_reader/model/objects/book_object.dart';
import 'package:ebook_reader/modules/book/presenter/book_presenter_input.dart';
import 'package:ebook_reader/modules/books/router/books_router_input.dart';
import 'package:flutter/cupertino.dart';
import '../view/books_view_output.dart';
import '../interactor/books_interactor_input.dart';

class BooksPresenter with BooksViewOutput {

  var interactor = BooksInteractorInput();

  var router = BooksRouterInput();

  static List<BookObject> booksArray = [];

  static int paginator = 1;

  static bool isLoading = false;

  loadData() async {

    booksArray.addAll(await interactor.getBooks(paginator));// = await interactor.getBooks(paginator);

    isLoading = false;

  }

  getBooks() async {

    return booksArray;

  }

  loadMoreData() {

    if (isLoading == false) {

      isLoading = true;

      paginator += 1;

      loadData();


    }


  }


  booksViewTitle() {

    return 'Flutter eBooks';
  }

  didSelectBookAt(int index, BuildContext context) async {

    var book = booksArray[index];

    router.openDetails(book, context);

  }

}