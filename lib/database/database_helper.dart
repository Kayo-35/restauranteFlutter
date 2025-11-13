import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';


class DatabaseHelper {
  static final nomeBanco = 'Solucao_Completa.db';
  static Database? db;

  static Future<Database> getDatabase() async {
    if(db != null) return db!;

    Directory diretorioBanco = await getApplicationDocumentsDirectory();
    String caminho = join(diretorioBanco.path, nomeBanco);

    if(!File(caminho).existsSync()) {
      ByteData data = await rootBundle.load("assets/$nomeBanco");
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(caminho).writeAsBytes((bytes));
    }
    db = await openDatabase(caminho);
    return db!;
  }
}