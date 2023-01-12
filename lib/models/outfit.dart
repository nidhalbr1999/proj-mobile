class outfit {
  String? name;
  String? image;
  String? weather;
  int? ownerId;

  outfit({this.name, this.image, this.weather, this.ownerId});

  outfit.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    weather = json['weather'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['weather'] = this.weather;
    data['owner_id'] = this.ownerId;
    return data;
  }
}