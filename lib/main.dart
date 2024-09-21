import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart'; // Asegúrate de que este archivo exista
import 'presentation/ticket/add_ticket_screen.dart';
import 'presentation/ticket/edit_ticket_screen.dart';
import 'presentation/ticket/ticket_list_screen.dart';
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TicketListScreen(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddTicketScreen(),
    ),
    GoRoute(
      path: '/edit/:id',
      builder: (context, state) {
        final id = state.params['id'];
        return EditTicketScreen(ticketId: id!);
      },
    ),
  ],
);


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
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Ticket Avion',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
