class Usuario {
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({int? codigo, String? nome, String? login, String? senha}) {
    _codigo = codigo;
    _nome = nome;
    _login = login;
    _senha = senha;
  }

  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get login => _login;
  String? get senha => _senha;

  set codigo(int? codigo) => _codigo = codigo;
  set nome(String? nome) => _nome = nome;
  set usuario(String? login) => _codigo = codigo;
  set senha(String? senha) => _codigo = codigo;
}