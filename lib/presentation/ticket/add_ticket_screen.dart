import 'package:flutter/material.dart';

class AddTicketScreen extends StatelessWidget {
  final TextEditingController vueloController = TextEditingController();
  final TextEditingController aerolineaController = TextEditingController();
  // Agregar más controladores para otros campos

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
            // Más campos como origen, destino, asiento, clase
            ElevatedButton(
              onPressed: () {
                // Llamar a Provider para guardar en Firebase
              },
              child: Text('Agregar Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
