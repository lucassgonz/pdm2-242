import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'alunos.dart';

class DatabaseHelper {
  late Database _db;

  Future<void> initDatabase() async {
    sqfliteFfiInit(); 
    databaseFactory = databaseFactoryFfi;

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'alunos.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE TB_ALUNOS (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            idade INTEGER
          )
        ''');
      },
    );
    print('Banco de dados inicializado!');
  }

  Future<int> inserirAluno(Aluno aluno) async {
    return await _db.insert('TB_ALUNOS', aluno.toMap());
  }

  Future<List<Aluno>> buscarAlunos() async {
    final List<Map<String, dynamic>> maps = await _db.query('TB_ALUNOS');
    return List.generate(maps.length, (i) => Aluno.fromMap(maps[i]));
  }

  Future<int> atualizarAluno(Aluno aluno) async {
    return await _db.update(
      'TB_ALUNOS',
      aluno.toMap(),
      where: 'id = ?',
      whereArgs: [aluno.id],
    );
  }

  Future<int> deletarAluno(int id) async {
    return await _db.delete(
      'TB_ALUNOS',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deletarTodosAlunos() async{
    return await _db.delete(
      'TB_ALUNOS',
      );
  }

  Future<void> fechar() async {
    await _db.close();
  }
}
