import 'package:ebook_reader/model/objects/book_object.dart';
import 'package:flutter/material.dart';
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
      future: output.getBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center (
            child: NotificationListener<ScrollNotification> (
              // ignore: missing_return
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  output.loadMoreData();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Loading..."),
                  ));

                  setState(() {
                    //isLoading = true;
                  });
                }
              },
              child: GridView.builder(
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
                        output.didSelectBookAt(index, context);
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
              ),
            ),
          );
        }
          return Center (
            child: CircularProgressIndicator(),
          );
      },

    );
  }

  @override
  void initState() {
    output.loadData();
    output.getBooks();
    super.initState();
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