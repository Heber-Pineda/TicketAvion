class Ticket {
  String id;
  String numeroVuelo;
  String aerolinea;
  String pasajero;
  String origen;
  String destino;
  String asiento;
  String clase;

  Ticket({
    required this.id,
    required this.numeroVuelo,
    required this.aerolinea,
    required this.pasajero,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  // Método para convertir el modelo a un mapa (para Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'pasajero': pasajero,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }

  // Método para crear un modelo desde un documento de Firestore
  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] ?? '',
      numeroVuelo: map['numeroVuelo'] ?? '',
      aerolinea: map['aerolinea'] ?? '',
      pasajero: map['pasajero'] ?? '',
      origen: map['origen'] ?? '',
      destino: map['destino'] ?? '',
      asiento: map['asiento'] ?? '',
      clase: map['clase'] ?? '',
    );
  }
}
