import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTicketScreen extends StatelessWidget {
  final TextEditingController vueloController = TextEditingController();
  final TextEditingController aerolineaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: vueloController,
              decoration: InputDecoration(labelText: 'Número de vuelo'),
            ),
            TextField(
              controller: aerolineaController,
              decoration: InputDecoration(labelText: 'Aerolínea'),
            ),
            ElevatedButton(
              onPressed: () {
                _addTicket(context);
              },
              child: Text('Agregar Ticket'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addTicket(BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('tickets').add({
        'vuelo': vueloController.text,
        'aerolinea': aerolineaController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ticket agregado con éxito')),
      );
      Navigator.pop(context); // Regresar a la pantalla de lista de tickets
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al agregar el ticket: $e')),
      );
    }
  }
}
