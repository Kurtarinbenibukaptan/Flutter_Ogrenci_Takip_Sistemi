class Student {
  int id;
  String firstName;
  String lastname;
  int grade;
  String _status;

  Student.withId(int id, String firstName, String lastname, int grade) {
    this.id = id;
    this.firstName = firstName;

    this.lastname = lastname;
    this.grade = grade;
  }
  Student(String firstName, String lastname, int grade) {
    this.firstName = firstName;

    this.lastname = lastname;
    this.grade = grade;
  }

  // ignore: empty_constructor_bodies
  Student.withoutInfo() {}

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
