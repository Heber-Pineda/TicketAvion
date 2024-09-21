import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore
import 'package:flutter/material.dart';

class DeleteTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eliminar Ticket')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tickets').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No hay tickets para eliminar'));
          }

          final tickets = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return ListTile(
                title: Text(ticket['vuelo']), // Suponiendo que tienes el campo 'vuelo'
                subtitle: Text(ticket['aerolinea']), // Suponiendo que tienes el campo 'aerolinea'
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTicket(ticket.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Función para eliminar un ticket de Firestore
  Future<void> _deleteTicket(String ticketId) async {
    try {
      await FirebaseFirestore.instance.collection('tickets').doc(ticketId).delete();
      print('Ticket eliminado con éxito');
    } catch (e) {
      print('Error al eliminar el ticket: $e');
    }
  }
}
