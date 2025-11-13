import '../usuario.dart';
class Restaurante {
  int? _codigo;
  String? _nome;
  String? _latitude;
  String? _longintude;
  Usuario? _proprietario;
  String? _tipo;

  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get latitude => _latitude;
  String? get longitude => _longintude;
  Usuario? get proprietario => _proprietario;
  String? get tipo => _tipo;

  set codigo(int? valor) => _codigo = valor;
  set nome(String? valor) => _nome = valor;
  set latitude(String? valor) => _latitude = valor;
  set longitude(String? valor) => _longintude = valor;
  set proprietario(Usuario? valor) => _proprietario = valor;
  set tipo(String? valor) => _tipo = valor;

  Restaurante ({int? codigo,String? nome,String? lat,String? lon,Usuario? proprietario, String? tipo}) {
    _codigo = codigo;
    _nome = nome;
    _latitude = lat;
    _longintude = lon;
    _proprietario = proprietario;
    _tipo = tipo;
  }
}

