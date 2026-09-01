class Services {
  late String name;
  late String description;
  late String image;

  Services({
   required this.name,
   required this.description,
   required this.image,
});
  Services.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
}