import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user.manager.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loja do Marcos',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 4, 125, 141),
            elevation: 0,
          ),
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BaseScreen(),
      ),
    );
  }
}
