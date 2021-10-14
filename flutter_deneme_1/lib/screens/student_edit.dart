import 'package:flutter/material.dart';
import 'package:flutter_deneme_1/models/student.dart';
import 'package:flutter_deneme_1/validation/student_validator.dart';

// ignore: must_be_immutable
class StudentEdit extends StatefulWidget {
 Student  selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
 Student selectedStudent;
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Seçilen Öğrenciyi Güncelleme"),
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
          InputDecoration(labelText: "Öğrenci Adı :", hintText:selectedStudent.firstName),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadi  :", hintText:selectedStudent.lastname),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastname = value;
      },
    );
  }

  buildGradeNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not :", hintText: selectedStudent.grade.toString()),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
 
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastname);
    print(selectedStudent.grade);
  }
}
