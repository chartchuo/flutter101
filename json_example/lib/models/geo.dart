class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Geo && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
