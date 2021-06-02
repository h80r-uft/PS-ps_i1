import 'package:flutter/material.dart';
import 'package:ps_i1/components/grade_show.dart';

class Grades extends StatelessWidget {
  const Grades({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const tempAluno = 'Brenda';
    const tempNota1 = 4.01;
    const tempNota1Cor = Colors.red;
    const tempNota2 = 8.99;
    const tempNota2Cor = Colors.green;
    const tempAverage = (tempNota1 + tempNota2) / 2;
    const tempAverageColor = Colors.yellow;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, $tempAluno!'),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(flex: 3),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Spacer(),
              Expanded(
                flex: 3,
                child: Grade(
                  grade: tempNota1,
                  title: 'Nota I',
                  color: tempNota1Cor,
                ),
              ),
              Spacer(),
              Expanded(
                flex: 3,
                child: Grade(
                  grade: tempNota2,
                  title: 'Nota II',
                  color: tempNota2Cor,
                ),
              ),
              Spacer()
            ],
          ),
          const Spacer(),
          Flex(
            direction: Axis.horizontal,
            children: const [
              Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 3,
                child: Grade(
                  grade: tempAverage,
                  title: 'Média Final',
                  color: tempAverageColor,
                ),
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
          const Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: OutlinedButton(
          onPressed: () {},
          child: const Text('Sair'),
        ),
      ),
    );
  }
}
