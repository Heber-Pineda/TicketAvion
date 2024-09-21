import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TicketListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tickets'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => context.go('/add'), // Navegar a la pantalla de agregar
          ),
        ],
      ),
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
            return Center(child: Text('No hay tickets disponibles'));
          }

          final tickets = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return ListTile(
                title: Text(ticket['vuelo']),
                subtitle: Text(ticket['aerolinea']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTicket(ticket.id, context);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deleteTicket(String ticketId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('tickets').doc(ticketId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ticket eliminado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el ticket: $e')),
      );
    }
  }
}
