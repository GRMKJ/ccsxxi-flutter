// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/foundation.dart';



class ListaCartelera{
  final List<Cartelera> cartelera;

  ListaCartelera({required this.cartelera});

  factory ListaCartelera.fromJson(List<Cartelera> json){
    List<Cartelera> cartelera =  List<Cartelera>.empty();
    cartelera = json.map((i)=>Cartelera.fromJson(i)).toList();
    
    return ListaCartelera(cartelera: cartelera);
  }

}

class Cartelera {
  final int ID;
  final int ID_EVENTO;
  final int ID_SALA;
  final int ESTADO;
  final String INICIO;
  final String FIN;
  final Evento EVENTO;
  final Sala SALA;

  const Cartelera({required this.ID,required this.ID_EVENTO,required this.ID_SALA,required this.ESTADO,required this.INICIO,required this.FIN,required this.EVENTO,required this.SALA});
  
  factory Cartelera.fromJson(Map<String, dynamic> json) {
    return Cartelera(
      ID : json['ID'] as int,
      ID_EVENTO : json['ID_EVENTO'] as int,
      ID_SALA : json['ID_SALA'] as int,
      ESTADO : json['ESTADO'] as int,
      INICIO : json['INICIO'] as String,
      FIN : json['FIN'] as String,
      EVENTO : Evento.fromJson(json['EVENTO']),
      SALA : Sala.fromJson(json['SALA']),
    );
  }

}

class Evento{
  final int ID;
  final int ID_ORGANIZADOR;
  final String NOMBRE;
  final String TIPO;
  final String DURACION;
  final String FOTO;

  const Evento({required this.ID,required this.ID_ORGANIZADOR,required this.NOMBRE,required this.TIPO,required this.DURACION,required this.FOTO});

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      ID : json['ID'] as int,
      ID_ORGANIZADOR : json['ID_ORGANIZADOR'] as int,
      NOMBRE : json['NOMBRE'] as String,
      TIPO : json['TIPO'] as String,
      DURACION : json['DURACION'] as String,
      FOTO : json['FOTO'] as String,
    );
  }
}

class Sala{
  final int ID;
  final int ESTADO;
  final String NOMBRE;
  final int ASIENTOS;

  const Sala({required this.ID, required this.ESTADO, required this.NOMBRE, required this.ASIENTOS});

  factory Sala.fromJson(Map<String, dynamic> json) {
    return Sala(
      ID : json['ID'] as int,
      ESTADO : json['ESTADO'] as int,
      NOMBRE : json['NOMBRE'] as String,
      ASIENTOS : json['ASIENTOS'] as int,
    );
  }
}