class News {
  String title;
  String author;
  String description;

  News({this.title, this.author, this.description});

  // factory News.fromJson(Map<String, dynamic> json) {
  //   return News(
  //       title: json['title'],
  //       author: json['author'],
  //       description: json['description']);
  // }
}
