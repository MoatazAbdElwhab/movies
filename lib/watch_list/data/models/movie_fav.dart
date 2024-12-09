class MovieFav {
  final int id;
  final String title;
  final String date;
  final String imgPath;

  MovieFav(
      {required this.id,
      required this.title,
      required this.date,
      required this.imgPath});

  MovieFav.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          date: json['date'],
          imgPath: json['imgPath'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'imgPath': imgPath,
      };
}
