class City {
  final int id;
  final String name;
  final String country;
  final Coordinate coordinate;

  const City({this.id, this.name, this.country, this.coordinate});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coordinate: json['coord']
    );
  }
}

class Coordinate {
  final double lon;
  final double lat;
  const Coordinate(this.lon, this.lat);
}
