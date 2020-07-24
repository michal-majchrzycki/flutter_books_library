import 'package:ebook_reader/modules/book/presenter/book_presenter.dart';
import 'package:flutter/material.dart';
import 'package:ebook_reader/model/objects/book_object.dart';

class BookPresenterInput {

  setBook(BookObject book) async {

    BookPresenter().setBook(book);

  }

}