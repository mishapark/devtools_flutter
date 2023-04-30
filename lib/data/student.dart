class Student {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String pic;
  final double average;
  final bool isActivist;

  const Student({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.pic,
    required this.average,
    required this.isActivist,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      firstname: json['firstName'] as String,
      lastname: json['lastName'] as String,
      email: json['email'] as String,
      pic: json['pic'] as String,
      average: json['average'] as double,
      isActivist: json['activist'] as bool,
    );
  }
}
