
class BookJson {

  final int totalItems;

  final List<Item> items;

  BookJson({this.items, this.totalItems});

  factory BookJson.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;

    List<Item> itemList = list.map((i) => Item.fromJson(i)).toList();

    return BookJson(
        items: itemList,
        totalItems: parsedJson['totalItems']);
  }


}

class Item {

  final BookInfo bookInfo;

  Item({this.bookInfo});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        bookInfo: BookInfo.fromJson(parsedJson['volumeInfo']));
  }
}

class BookInfo {

  final String title;

  final List<dynamic> authors;

  final String publisher;

  final String language;

  final String year;

  final String description;

  final ImageLinks cover;

  BookInfo(
      {this.authors, this.language, this.title, this.publisher, this.cover, this.year, this.description});

  factory BookInfo.fromJson(Map<String, dynamic> parsedJson) {

    print('GETTING DATA');
    return BookInfo(
      title: parsedJson['title'],
      authors: parsedJson['authors'],
      publisher: parsedJson['publisher'],
      language: parsedJson['language'],
      year: parsedJson['publishedDate'],
      description: parsedJson['description'],
      cover: ImageLinks.fromJson(
        parsedJson['imageLinks'],
      ),

    );
  }
}

class ImageLinks {
  String smallthumb;
  String bigthumb;

  ImageLinks({this.bigthumb, this.smallthumb});

  factory ImageLinks.fromJson(Map<String, dynamic> parsedJson) {
    return ImageLinks(
        bigthumb: parsedJson['thumbnail'],
        smallthumb: parsedJson['smallThumbnail']);
  }
}