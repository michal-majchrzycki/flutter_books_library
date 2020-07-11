import 'package:ebook_reader/model/objects/book_object.dart';
import 'package:flutter/material.dart';
import '../../book/view/book_view.dart';
import 'books_view_output.dart';

class BooksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BooksViewPage();
  }
}

class BooksViewPage extends StatefulWidget {
  BooksViewPage({Key key}) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksViewPage> {

  var output = new BooksViewOutput();

  Widget booksListWidget() {

    return FutureBuilder (
      future: output.viewIsReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2/2,
                crossAxisCount: 2
            ),
            itemBuilder: (context, index) {
              BookObject project = snapshot.data[index];
              return Center(
                child: InkWell (
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Column(
                    children: <Widget>[
                      Image.network(project.cover, height: 130),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5, right: 10),
                        child: Text(
                          project.title,
                            overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          project.author,
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
          return CircularProgressIndicator();
      },

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(output.booksViewTitle()),
        backgroundColor: Colors.blueGrey,
      ),
      body: booksListWidget(),

    );
  }

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