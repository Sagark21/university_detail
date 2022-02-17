class UniversityList {
  final List<University>? university;

  UniversityList({
    this.university,
  });

  factory UniversityList.fromJson(List<dynamic> parsedJson) {
    List<University> detail;
    detail = parsedJson.map((i) => University.fromJson(i)).toList();

    return new UniversityList(university: detail);
  }
}

class University {
  String? country;
  String? name;

  University({
    this.country,
    this.name,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return new University(
      country: json['country'].toString(),
      name: json['name'],
    );
  }
}
