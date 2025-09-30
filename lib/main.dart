import 'package:flutter/material.dart';
import 'package:midleapp/screens/loginscreen.dart';
import 'package:midleapp/screens/registroscreen.dart';
import 'package:midleapp/screens/thermometer_screen.dart'; // 1. Importe a nova tela
import 'options/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midleapp/screens/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindleApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/thermometer': (context) => const ThermometerScreen(), // 2. Adicione a nova rota
      },
    );
  }
}
