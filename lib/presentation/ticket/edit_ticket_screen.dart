import 'package:flutter/material.dart';

class EditTicketScreen extends StatelessWidget {
  final String? ticketId;

  EditTicketScreen({Key? key, this.ticketId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Ticket'),
      ),
      body: Center(
        child: Text('Editar ticket con ID: $ticketId'),
      ),
    );
  }
}
