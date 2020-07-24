import 'package:ebook_reader/model/objects/book_object.dart';
import 'package:ebook_reader/modules/book/presenter/book_presenter.dart';
import 'package:ebook_reader/modules/book/presenter/book_presenter_input.dart';
import 'package:ebook_reader/modules/book/view/book_view.dart';
import 'package:ebook_reader/modules/books/router/books_router_input.dart';
import 'package:flutter/cupertino.dart';

class BooksRouter implements BooksRouterInput {


  openDetails(BookObject book, BuildContext context) {

    BookPresenterInput().setBook(book);

    Navigator.of(context).push(_createRoute());

  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BookView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}