class AnimeModel {
  int id;
  String title;
  String image;
  int episodes;
  String description;

  AnimeModel({required this.id,
    required this.title,
    required this.image,
    required this.episodes,
    required this.description});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(id: json["id"] as int,
        title: json["title"] as String,
        image: json["image"] as String,
        episodes: json["episodes"] as int,
        description: json["description"] as String,
    );
  }
}