class User {
  final String name;
  final int age;
  final List<String> professions;

  User({required this.name, required this.age, this.professions = const []});

  User copyWith({String? name, int? age, List<String>? professions}) {
    return User(
        name: name ?? this.name,
        age: age ?? this.age,
        professions: professions ?? this.professions);
  }
}
