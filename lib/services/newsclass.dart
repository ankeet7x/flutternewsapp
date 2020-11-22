class News {
  String title;
  String author;
  String description;
  DateTime publishedDate;
  String urlToImage;
  String content;

  News(
      {this.title,
      this.author,
      this.description,
      this.publishedDate,
      this.content,
      this.urlToImage});

  // factory News.fromJson(Map<String, dynamic> json) {
  //   return News(
  //       title: json['title'],
  //       author: json['author'],
  //       description: json['description']);
  // }
}
