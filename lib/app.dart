import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        return EditTicketScreen(ticketId: id!); // Asegúrate de manejar el ID como no nulo
      },
    ),
  ],
);

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
