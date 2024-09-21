import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else {
      // Agrega más opciones para otras plataformas como Android, iOS, etc.
      throw UnsupportedError(
          'DefaultFirebaseOptions no está configurado para esta plataforma.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyAGvdpzx7lX-V4BQ9MkgxdkyZJxlqL4Y2s",
    authDomain: "ticketavion-6918f.firebaseapp.com",
    projectId: "ticketavion-6918f",
    storageBucket: "ticketavion-6918f.appspot.com",
    messagingSenderId: "268811968186",
    appId: "1:268811968186:web:afca870b6dd8dc4374ec83",
    measurementId: "G-G9Y1C5P08B",
  );

  // Aquí puedes agregar configuraciones para otras plataformas, como Android o iOS si las necesitas.
  // static const FirebaseOptions android = FirebaseOptions(...);
  // static const FirebaseOptions ios = FirebaseOptions(...);
}
