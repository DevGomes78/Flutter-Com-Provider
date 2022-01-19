import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_validation/components/app_textstyle.dart';
import 'package:provider_validation/provider/validation_provider.dart';
import 'package:provider_validation/screens/wellcome.dart';

class ValidarCampos extends StatelessWidget {
  const ValidarCampos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validacao = Provider.of<ValidacaoCampos>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Validar Campos'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorText: validacao.nome.error,
                ),
                onChanged: (String value) {
                  validacao.ValidationFirstName(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sobrenome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorText: validacao.sobrenome.error,
                ),
                onChanged: (String value) {
                  validacao.ValidationLastName(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorText: validacao.email.error,
                ),
                onChanged: (String value) {
                  validacao.ValidationEmail(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorText: validacao.telefone.error,
                ),
                onChanged: (String value) {
                  validacao.ValidationPhone(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: InkWell(
                  onTap: () {
                    if (validacao.nome.value == null &&
                        validacao.sobrenome.value == null &&
                        validacao.telefone.value == null &&
                        validacao.email.value == null) {
                      final snackBar =
                          SnackBar(content: Text('Campos em Branco!'));
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  WelCome(validacao: validacao.nome)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        'Validar',
                        style: AppTextStyle.TextFont22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
