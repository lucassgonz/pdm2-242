import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeProjeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeProjeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  var dependente1 = Dependente("Dependente A");
  var dependente2 = Dependente("Dependente B");
  var dependente3 = Dependente("Dependente C");

  var funcionario1 = Funcionario("Funcionario 1", [dependente1]);
  var funcionario2 = Funcionario("Funcionario 2", [dependente2, dependente3]);

  var funcionarios = [funcionario1, funcionario2];

  var equipeProjeto = EquipeProjeto("Projeto X", funcionarios);

  String equipeProjetoJson = jsonEncode(equipeProjeto.toJson());
  print(equipeProjetoJson);
}
