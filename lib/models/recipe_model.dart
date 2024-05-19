class RecipeModel {
  String title;
  String imgUrl;

  RecipeModel({
    required this.title,
    required this.imgUrl,
  });

  toJson() => {
        'title': title,
        'imgUrl': imgUrl,
      };
}