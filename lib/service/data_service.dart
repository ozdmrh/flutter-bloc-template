import 'dart:convert';
import 'package:flutter_bloc_template/model/user_post.dart';
import 'package:flutter_bloc_template/model/user.dart';
import 'package:http/http.dart' as http;

class DataService {
  final _baseURL = 'jsonplaceholder.typicode.com';
  final _picsumURL = 'picsum.photos';

  Future<List<User>> getUsers() async {
    try {
      final uri = Uri.https(_baseURL, '/users');
      final response = await http.get(uri);
      final json = jsonDecode(response.body) as List;
      final users = json.map((userJson) => User.fromJson(userJson)).toList();
      return users;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserPost>> getUserPosts(int userId) async {
    try {
      final uri = Uri.https(_baseURL, '/posts', {'userId': '$userId'});
      final response = await http.get(uri);
      final json = jsonDecode(response.body) as List;
      final userPosts = json.map((postJson) => UserPost.fromJson(postJson)).toList();
      return userPosts;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPicsum() async {
    try {
      final uri = Uri.https(_picsumURL, '/500/200');
      final response = await http.get(uri);
      return response.body;
    } catch (e) {
      rethrow;
    }
  }
}
