class RecipeItem {
  //TODO lägg till servings
  //TODO lägg till en till model med ingridiesner
  int id;
  String title;
  String image;
  int readyInMinutes;

  RecipeItem({
    this.id,
    this.title,
    this.image,
    this.readyInMinutes,
  });

  static Map<String, dynamic> toJson(RecipeItem item) {
    return {
      'id': item.id,
      'title': item.title,
      'image': item.image,
      'readyInMinutes': item.readyInMinutes,
    };
  }

  static RecipeItem fromJson(Map<String, dynamic> json) {
    return RecipeItem(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'],
    );
  }
}
