
import 'package:flutter/material.dart';

class TicketListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tickets'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los tickets.'),
      ),
    );
  }
}
