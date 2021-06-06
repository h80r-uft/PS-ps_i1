/// Abstração para adição de estudantes.
///
/// Mantém as ações que o serviço executa.
///
/// ### Ações
/// - [register]
///     - Registra o novo estudante.
abstract class AddStudentService {
  Future<void> register(String nome, String email, String password);
}
