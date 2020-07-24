import 'dart:convert';
import 'dart:developer';
import 'api_url.dart';
import '../objects/book_json.dart';
import 'package:http/http.dart' as http;

class ApiConnector {

  Future<List> getBooks(int page) async {

    var url = ApiUrl().flutterUrl + '?page=$page';

    final jsonResponse = await http.get(url);

    var jsonBody = jsonDecode(jsonResponse.body);

    var booksList = BookJson.fromJson(jsonBody).items;

    return booksList;

  }


}