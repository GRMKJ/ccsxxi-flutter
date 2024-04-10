// ignore_for_file: non_constant_identifier_names

class LoginResponse{
  final bool estatus;
  final Usuario usuario;

  const LoginResponse({required this.estatus,required this.usuario});

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(
      estatus: json['estatus'],
      usuario: Usuario.fromJson(json['usuario']),
    );
  }
}

class Usuario{
  final String ID;
  final String ID_PERSONA;
  final String ESTADO;
  final String CORREO;
  final String USERNAME;
  final String ROL;
  final Persona PERSONA;

  Usuario({required this.ID, required this.ID_PERSONA, required this.ESTADO, required this.CORREO, required this.USERNAME, required this.ROL, required this.PERSONA});
  

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
      ID: json['ID'],
      ID_PERSONA: json['ID_PERSONA'],
      ESTADO: json['ESTADO'],
      CORREO: json['CORREO'],
      USERNAME: json['USERNAME'],
      ROL: json['ROL'],
      PERSONA: Persona.fromJson(json['PERSONA']),
  
    );
  }
}

class Persona{
  final String ID;
  final String NOMBRE;
  final String A_PATERNO;
  final String A_MATERNO;
  final String FECHA_NAC;
  final String TELEFONO;

  Persona({required this.ID, required this.NOMBRE, required this.A_PATERNO, required this.A_MATERNO, required this.FECHA_NAC, required this.TELEFONO});


  factory Persona.fromJson(Map<String, dynamic> json){
    return Persona(
      ID: json['ID'],
      NOMBRE: json['NOMBRE'],
      A_PATERNO: json['A_PATERNO'],
      A_MATERNO: json['A_MATERNO'],
      FECHA_NAC: json['FECHA_NAC'],
      TELEFONO: json['TELEFONO'],  
    );
  }
  
}