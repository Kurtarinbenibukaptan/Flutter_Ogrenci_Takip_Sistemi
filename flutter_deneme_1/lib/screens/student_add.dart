import 'package:flutter/material.dart';
import 'package:flutter_deneme_1/models/student.dart';
import 'package:flutter_deneme_1/validation/student_validator.dart';

// ignore: must_be_immutable
class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeNameField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  buildFirstNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Adı :", hintText: "Engin"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadi  :", hintText: "Demiroğ"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastname = value;
      },
    );
  }

  buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not :", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveStudent2();
          saveStudent();
        }
      },
    );
  }

  void saveStudent2() => students.add(student);

  void saveStudent() {
    print(student.firstName);
    print(student.lastname);
    print(student.grade);
  }
}
