import 'database.dart';
import 'alunos.dart';
void main() async {
  final dbHelper = DatabaseHelper();

  await dbHelper.initDatabase();

  print("Atividade feita por Lucas Gonzaga Andrade");

  Aluno aluno1 = Aluno(nome: 'João', idade: 20);
  Aluno aluno2 = Aluno(nome: 'Maria', idade: 22);

  await dbHelper.inserirAluno(aluno1);
  await dbHelper.inserirAluno(aluno2);
  print('Alunos inseridos!');

  List<Aluno> alunos = await dbHelper.buscarAlunos();
  print('Lista de alunos:');
  for (var aluno in alunos) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  }

  Aluno alunoAtualizado = Aluno(id: alunos[0].id, nome: 'João Silva', idade: 21);
  await dbHelper.atualizarAluno(alunoAtualizado);
  print('Aluno atualizado!');

  alunos = await dbHelper.buscarAlunos();
  print('Lista de alunos atualizada:');
  for (var aluno in alunos) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  }

  await dbHelper.deletarAluno(alunos[1].id!);
  print('Aluno deletado!');

  alunos = await dbHelper.buscarAlunos();
  print('Lista final de alunos:');
  for (var aluno in alunos) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  }

  await dbHelper.deletarTodosAlunos();
  print("Todos foram deletados com sucesso");
  
  alunos = await dbHelper.buscarAlunos();
  print('Lista final com alunos deletados:');
  for (var aluno in alunos) {
    print('ID: ${aluno.id}, Nome: ${aluno.nome}, Idade: ${aluno.idade}');
  }


  await dbHelper.fechar();
}


