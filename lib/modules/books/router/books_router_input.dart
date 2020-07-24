import 'package:ebook_reader/model/objects/book_object.dart';
import 'package:ebook_reader/modules/books/router/books_router.dart';
import 'package:flutter/cupertino.dart';

class BooksRouterInput {

  openDetails(BookObject book, BuildContext context) {

    BooksRouter().openDetails(book, context);

  }

}