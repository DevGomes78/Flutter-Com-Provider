import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_validation/provider/validation_provider.dart';
import 'package:provider_validation/routes/routes.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ValidacaoCampos(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       routes: {
          AppRoutes.HOMEPAGE:(context)=> HomePage(),
       },
      ),
    );
  }
}
