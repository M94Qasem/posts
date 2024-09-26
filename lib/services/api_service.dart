import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await client.get(
        Uri.parse("https://freefakeapi.io/api/posts"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        return body.map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e, s) {
      print('Error: $e');
      print('Stack trace: $s');
      return [];
    }
  }

  Future<Post?> createPost(Map<String, dynamic> data) async {
    try {
      final response = await client.post(
        Uri.parse("https://freefakeapi.io/api/posts"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        return Post.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e, s) {
      print('Error: $e');
      print('Stack trace: $s');
      return null;
    }
  }
}


//http without client

// class ApiService {
//   final String baseUrl = 'https://freefakeapi.io/api/posts';
//
//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(Uri.parse(baseUrl));
//
//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
//       return posts;
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
// }


//dio

// class ApiService {
//   final Dio dio;
//
//   ApiService({required this.dio});
//
//   Future<List<Post>> fetchPosts() async {
//     try {
//       final response = await dio.get("https://freefakeapi.io/api/posts");
//       return (response.data as List).map((e) => Post.fromJson(e)).toList();
//     } catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }
// }



//retrofit

// part 'api_service.g.dart';
//
// @RestApi(baseUrl: "https://freefakeapi.io/api")
// abstract class ApiService {
//   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
//
//   @GET("/posts")
//   Future<List<Post>> fetchPosts();
// }




