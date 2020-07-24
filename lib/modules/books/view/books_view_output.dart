import 'package:flutter/cupertino.dart';

import '../presenter/books_presenter.dart';

class BooksViewOutput {

  loadData() {

    BooksPresenter().loadData();
  }

  getBooks() async {

    return await BooksPresenter().getBooks();

  }

  loadMoreData() {

    BooksPresenter().loadMoreData();
  }

  booksViewTitle() {

    return BooksPresenter().booksViewTitle();

  }

  didSelectBookAt(int index, BuildContext context) {

    BooksPresenter().didSelectBookAt(index, context);

  }

}