import 'package:ebook_reader/model/objects/book_object.dart';
import 'package:ebook_reader/modules/book/presenter/book_presenter_input.dart';
import 'package:flutter/material.dart';
import 'book_view_output.dart';
import 'package:country_icons/country_icons.dart';

class BookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BookViewPage();
  }
}

class BookViewPage extends StatefulWidget {
  BookViewPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookViewPage> {

  var output = new BookViewOutput();

  Widget bookTitle() {
    return FutureBuilder(
        future: output.bookTitle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          }
          return Text(output.noBookTitle());
        }
    );
  }

  Widget bookAuthor() {
    return FutureBuilder(
        future: output.bookAuthor(),
        builder: (context, snapshot) {
          var text = output.noBookAuthor();
          if (snapshot.hasData) {
            if (snapshot.data != 'null') {
              text = snapshot.data;
            }
          } else {
            output.noBookAuthor();
          }
          return Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ));
        }
    );
  }

  Widget bookYear() {
    return FutureBuilder(
        future: output.bookYear(),
        builder: (context, snapshot) {
          var text = output.noBookYear();
          if (snapshot.hasData) {
            if (snapshot.data != 'null') {
              text = snapshot.data;
            }
          }
          return Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              )
          );
        }
    );
  }

  Widget bookPublisher() {
    return FutureBuilder(
        future: output.bookPublisher(),
        builder: (context, snapshot) {
          var text = output.noBookPublisher();
          if (snapshot.hasData) {
            if (snapshot.data != 'null') {
              text = snapshot.data;
            }
          }
          return Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              )
          );
        }
    );
  }

  Widget bookLanguage() {
    return FutureBuilder(
        future: output.bookLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != 'null') {
              var img = snapshot.data;
              if (img == 'en') {
                img = 'gb';
              }
              return Image.asset(
                  'icons/flags/png/$img.png', package: 'country_icons',
                scale: 4.2,
              );
            }
          }
          return Text(
              output.noBookLanguage(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              )
          );
        }
    );
  }

  Widget bookDescription() {
    return FutureBuilder(
        future: output.bookDescription(),
        builder: (context, snapshot) {
          var text = output.noBookDescription();
          if (snapshot.hasData) {
            if (snapshot.data != 'null') {
              text = snapshot.data;
            }
          }
          return Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              )
          );
        }
    );
  }

  Widget bookImage() {
    return FutureBuilder(
        future: output.bookImage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image.network(snapshot.data, height: 200);
          }
          return Icon(Icons.book, color: Colors.white, size: 200);
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: bookTitle(),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: bookImage(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: bookAuthor(),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: bookDescription(),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              height: 0.5,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  bookYear(),
                  bookPublisher(),
                  bookLanguage(),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}