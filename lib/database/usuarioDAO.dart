import 'package:aula1/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:aula1/usuario.dart';

class UsuarioDAO {
  static Usuario usuarioLogado = Usuario();
  static Future<bool> autenticar(String? usuario, String? senha) async {
    final Database db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_usuario',
      where: 'nm_login = ? AND ds_senha = ?',
      whereArgs: [
        usuario,senha
      ]);
    if(resultado.isNotEmpty) {
      usuarioLogado.codigo = resultado.first['cd_usuario'] as int;
      usuarioLogado.nome = resultado.first['nm_usuario'] as String;
    }
    return resultado.isNotEmpty;
  }
}