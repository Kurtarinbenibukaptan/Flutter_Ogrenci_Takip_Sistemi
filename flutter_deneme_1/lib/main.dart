import 'package:flutter/material.dart';
import 'package:flutter_deneme_1/models/student.dart';
import 'package:flutter_deneme_1/screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "emrecan", "guzelaydın", 45),
    Student.withId(2, "halil", "ermiş", 35),
    Student.withId(3, "kerem", "özmen", 65)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesajNot) {
    var alert = AlertDialog(
      title: Text("İslem Sonucu"),
      content: Text(mesajNot),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://icon-icons.com/icon/cdn/117865")),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastname),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili öğrenci :  " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.yellowAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 1.0,
                    ),
                    Text("Yeni Ogrenci!"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                textColor: Colors.blueGrey,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 1.0,
                    ),
                    Text("Guncelle!"),
                  ],
                ),
                onPressed: () {
                  var mesajNot =
                      "Öğrenci Güncellendi :   " + selectedStudent.firstName;
                  mesajGoster(context, mesajNot);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 1.0,
                    ),
                    Text("Sil!"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesajNot =
                      "Öğrenci Silindi :   " + selectedStudent.firstName;
                  mesajGoster(context, mesajNot);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
