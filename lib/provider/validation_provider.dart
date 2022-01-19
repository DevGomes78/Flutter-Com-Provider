import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider_validation/Model/validation.dart';


class ValidacaoCampos with ChangeNotifier {
  Validation _nome = Validation();
  Validation _sobrenome = Validation();
  Validation _email = Validation();
  Validation _telefone = Validation();

  //Get
  Validation get nome => _nome;

  Validation get sobrenome => _sobrenome;

  Validation get email => _email;

  Validation get telefone => _telefone;

  //set
  //Valida Campo nome
  void ValidationFirstName(String value) {
    if (value.trim().length < 4) {
      _nome = Validation(error: 'Mínimo 4 caracteres');
    } else if (value == null || value.trim().isEmpty) {
      _nome = Validation(error: 'Campos em branco!');
    } else {
      _nome = Validation(value: value);
    }
    notifyListeners();
  }

//Valida Campo sobrenome
  void ValidationLastName(String value) {
    if (value.trim().length < 4) {
      _sobrenome = Validation(error: 'Minimo 4 caracteres');
    } else if (value == null || value.trim().isEmpty) {
      _sobrenome = Validation(error: 'Campos em branco');
    } else {
      _sobrenome = Validation(value: value);
    }
    notifyListeners();
  }

//Valida Campo email
  void ValidationEmail(String value) {
    final bool isValid = EmailValidator.validate(value.trim());
    if (isValid) {
      _email = Validation(value: value);
    } else {
      _email = Validation(error: 'Email invalido');
    }
    notifyListeners();
  }

//Valida Campo telefone
  void ValidationPhone(String value) {
    if (value.trim().length < 11) {
      _telefone = Validation(error: 'Digite Telefone Completo Com DDD');
    } else if (value == null || value.trim().isEmpty) {
      _telefone = Validation(error: 'Campos em branco');
    } else {
      _telefone = Validation(value: value);
    }
    notifyListeners();
  }
}
