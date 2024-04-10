// ignore_for_file: non_constant_identifier_names

class ListaCartelera{
  final List<Cartelera> cartelera;

  const ListaCartelera({required this.cartelera});

  factory ListaCartelera.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['cartelera'] as List;
    List<Cartelera> cartelera = list.map((cartelera) => Cartelera.fromJson(cartelera)).toList();

    return  ListaCartelera(
      cartelera: cartelera
    );
  }
}

class Cartelera {
  final String ID;
  final String ID_EVENTO;
  final String ID_SALA;
  final String ESTADO;
  final String INICIO;
  final String FIN;
  final Evento EVENTO;
  final Sala SALA;

  const Cartelera({required this.ID,required this.ID_EVENTO,required this.ID_SALA,required this.ESTADO,required this.INICIO,required this.FIN,required this.EVENTO,required this.SALA,});

  factory Cartelera.fromJson(Map<String, dynamic> json){
    return Cartelera(
      ID: json['ID'],
      ID_EVENTO: json['ID_EVENTO'],
      ID_SALA: json['ID_SALA'],
      ESTADO: json['ESTADO'],
      INICIO: json['INICIO'],
      FIN: json['FIN'],
      EVENTO: Evento.fromJson(json['EVENTO']),
      SALA: Sala.fromJson(json['SALA']),
    );
  }
  
}

class Evento{
  final String ID;
  final String ID_ORGANIZADOR;
  final String NOMBRE;
  final String TIPO;
  final String DURACION;
  final String FOTO;

  const Evento(
    {
      required this.ID,
      required this.ID_ORGANIZADOR,
      required this.NOMBRE,
      required this.TIPO,
      required this.DURACION,
      required this.FOTO,
    }
  );

  factory Evento.fromJson(Map<String, dynamic> json){
    return Evento(
      ID: json['ID'],
      ID_ORGANIZADOR: json['ID_ORGANIZADOR'],
      NOMBRE: json['NOMBRE'],
      TIPO: json['TIPO'],
      DURACION: json['DURACION'],
      FOTO: json['FOTO'],
    );
  }
}

class Sala{
  final String ID;
  final String ESTADO;
  final String NOMBRE;
  final String ASIENTOS;

  Sala(
    {
      required this.ID, 
      required this.ESTADO, 
      required this.NOMBRE, 
      required this.ASIENTOS
    }
  );

  factory Sala.fromJson(Map<String, dynamic> json){
    return Sala(
      ID: json['ID'],
      ESTADO: json['ESTADO'],
      NOMBRE: json['NOMBRE'],
      ASIENTOS: json['ASIENTOS']
    );
  }
}