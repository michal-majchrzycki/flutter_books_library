import 'package:flutter/material.dart';
import 'book_view_output.dart';

class BookView extends StatelessWidget {

  var output = new BookViewOutput();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(output.bookTitle()),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container (
              child: Icon(Icons.library_books, size: 200, color: Colors.white,),
            ),
            Container (
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                output.bookAuthor(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container (
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Text(
                output.bookDescription(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Spacer(),
            Container (
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              height: 0.5,
              color: Colors.white,
            ),
            Container (
              margin: EdgeInsets.only(bottom: 20),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    output.bookYear(),
                    style: TextStyle (
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    output.bookPublisher(),
                    style: TextStyle (
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    output.bookLanguage(),
                    style: TextStyle (
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
}