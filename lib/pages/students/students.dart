import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ps_i1/components/students_item.dart';
import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/models/user.dart';

class Students extends StatelessWidget {
  const Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tempStudents = [
      Student(
        User(name: 'Hernandes Macedo', uid: '1'),
        firstGrade: 9,
        secondGrade: 9,
      ),
      Student(
        User(name: 'Thaís Faustino', uid: '2'),
        firstGrade: 10,
        secondGrade: 10,
      ),
      Student(
        User(name: 'Heitor Galdino', uid: '3'),
        firstGrade: 5,
        secondGrade: 5,
      ),
      Student(
        User(name: 'Hernandes Macedo', uid: '1'),
        firstGrade: 9,
        secondGrade: 9,
      ),
      Student(
        User(name: 'Thaís Faustino', uid: '2'),
        firstGrade: 10,
        secondGrade: 10,
      ),
      Student(
        User(name: 'Heitor Galdino', uid: '3'),
        firstGrade: 5,
        secondGrade: 5,
      ),
      Student(
        User(name: 'Hernandes Macedo', uid: '1'),
        firstGrade: 9,
        secondGrade: 9,
      ),
      Student(
        User(name: 'Thaís Faustino', uid: '2'),
        firstGrade: 10,
        secondGrade: 10,
      ),
      Student(
        User(name: 'Heitor Galdino', uid: '3'),
        firstGrade: 5,
        secondGrade: 5,
      ),
    ];
    const tempIsEditing = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Notas'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => StudentItem(
          size: MediaQuery.of(context).size,
          fullName: tempStudents[index].name,
          status: Random().nextInt(3),
        ),
        itemCount: tempStudents.length,
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).primaryColor,
          indent: 25,
          endIndent: 25,
        ),
      ),
      bottomSheet: tempIsEditing
          ? Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hernandes Macedo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  TextFormField(
                    initialValue: 'Nota 1',
                  ),
                  TextFormField(
                    initialValue: 'Nota 2',
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
