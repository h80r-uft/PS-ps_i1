import 'package:flutter/material.dart';

/// Representação visual de um estudante.
class StudentItem extends StatelessWidget {
  /// Nome completo do estudante.
  final String fullName;

  /// Estado das notas do estudante.
  ///
  /// Define a cor do 'avatar' do estudante.
  /// ### Descrição
  /// - `0`: Nenhuma nota presente:
  ///     - Vermelho
  /// - `1`: Uma nota presente
  ///     - Amarelo
  /// - `2`: Duas notas presentes
  ///     - Verde
  final int status;

  const StudentItem({
    Key? key,
    required this.size,
    required this.fullName,
    required this.status,
  }) : super(key: key);

  /// Tamanho da tela em que o [StudentItem]
  /// se apresenta.
  final Size size;

  /// Obtém as iniciais do estudante.
  ///
  /// Através da divisão do [fullName]
  /// retorna as iniciais do estudante.
  initials() {
    List<String> name = fullName.split(" ");
    String initials = '';
    initials += '${name[0][0]}';
    initials += '${name[1][0]}';

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.06, vertical: size.height * 0.006),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: (status != 0)
                ? (status == 1)
                    ? Colors.yellow.shade700
                    : Colors.green
                : Colors.red,
            radius: size.width * 0.06,
            child: Text(
              initials(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Text(
            fullName,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
