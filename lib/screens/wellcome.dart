import 'package:flutter/material.dart';
import 'package:provider_validation/Model/validation.dart';
import 'package:provider_validation/components/app_textstyle.dart';
import 'package:provider_validation/routes/routes.dart';

class WelCome extends StatelessWidget {
  Validation validacao;

  WelCome({required this.validacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),

        title: Text(' Bem vindo ! ${validacao.value}',
            style: AppTextStyle.TextFont22),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          ' Bem vindo ! ${validacao.value}',
          style: AppTextStyle.TextFont24,
        ),
      ),
    );
  }
}
