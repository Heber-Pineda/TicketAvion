import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/ticket_model.dart';  // Asegúrate de importar el modelo correctamente

class TicketProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Función para agregar un ticket a Firestore
  Future<void> addTicket(Ticket ticket) async {
    await _firestore.collection('tickets').add(ticket.toMap());
    notifyListeners();  // Notifica a los listeners para actualizar la UI
  }

  // Función para obtener la lista de tickets como un stream
  Stream<List<Ticket>> getTickets() {
    return _firestore.collection('tickets').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Ticket.fromMap(doc.data())).toList();
    });
  }

  // Función para actualizar un ticket existente en Firestore
  Future<void> updateTicket(String id, Ticket ticket) async {
    await _firestore.collection('tickets').doc(id).update(ticket.toMap());
    notifyListeners();  // Notifica a los listeners para actualizar la UI
  }

  // Función para eliminar un ticket de Firestore
  Future<void> deleteTicket(String id) async {
    await _firestore.collection('tickets').doc(id).delete();
    notifyListeners();  // Notifica a los listeners para actualizar la UI
  }
}
