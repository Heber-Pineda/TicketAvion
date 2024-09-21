import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart'; // Importa el archivo generado

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Utiliza la configuración generada
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase App'),
        ),
        body: Center(
          child: Text('Firebase setup complete'),
        ),
      ),
    );
  }
}
