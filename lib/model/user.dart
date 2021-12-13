class User {
  late final int? id;
  late final String? name;
  late final String? username;
  late final String? email;
  late final String? phone;
  late final String? website;
  late final Address? address;
  late final Geo? geo;
  late final Company? company;

  User({this.id, this.name, this.username, this.email, this.phone, this.website, this.address, this.geo, this.company});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address'] ?? {}),
      geo: Geo.fromJson(json['geo'] ?? {}),
      company: Company.fromJson(json['company'] ?? {}));
}

class Address {
  late final String? street;
  late final String? suite;
  late final String? city;
  late final String? zipcode;

  Address({this.street, this.suite, this.city, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
      );
}

class Geo {
  late final String? lat;
  late final String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(lat: json['lat'], lng: json['lng']);
}

class Company {
  late final String? name;
  late final String? catchPhrase;
  late final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
      );
}
