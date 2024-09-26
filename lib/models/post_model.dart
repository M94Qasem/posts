class Post {
  final String title;
  final String? imageUrl;
  final String content;

  Post({
    required this.title,
    this.imageUrl,
    required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      imageUrl: json['picture'],
      content: json['content'],
    );
  }

  // If you need to send Post data as JSON to an API, you might need this method:
  // Map<String, dynamic> toJson() {
  //   return {
  //     'title': title,
  //     'picture': imageUrl,
  //     'content': content,
  //     'slug': slug,
  //     'user': userId,
  //   };
  // }


}
