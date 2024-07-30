import 'package:chat_uygulamasi/view/login_page.dart';
import 'package:chat_uygulamasi/viewnodel/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      title: "BOSSCHAT",
      home: const LoginPage(),
    );
  }
}
