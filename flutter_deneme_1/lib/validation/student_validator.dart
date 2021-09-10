class StudentValidationMixin {
// ignore: missing_return
  String validateFirstName(String value) {
    if (value.length < 2) {
      return 'İsim en az iki karakter olmalıdır';
    }
  }

// ignore: missing_return
  String validateLastName(String value) {
    if (value.length < 2) {
      return 'Soyad en az iki karakter olmalıdır';
    }
  }

// ignore: missing_return
  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      // The user haven't typed anything
      return " Öğrenci notu 0-100 arasında olmak zorundadır";
    }
  }
}
