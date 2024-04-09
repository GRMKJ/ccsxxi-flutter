// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:ccsxxi/eventdetail.dart';
import 'package:ccsxxi/ticketdetail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ccsxxi/models/cartelera.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:async';

Future<ListaCartelera> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://minitechsolutions.shop/ccsxxitest/api/cartelerahome.php'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.body);
    return ListaCartelera.fromJson(jsonDecode(response.body) as List<dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ListViewCarteleraP extends StatefulWidget{
  const ListViewCarteleraP({super.key});

  @override
  State<ListViewCarteleraP> createState() => ListViewCarteleraPState();
}

class ListViewCarteleraPState extends State<ListViewCarteleraP>{
  late Future<ListaCartelera> cartelera;

  @override
  void initState() {
    super.initState();
    cartelera = fetchAlbum();
  }

  @override
  Widget build(BuildContext context){
    
      return FutureBuilder<ListaCartelera>(
      future: fetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.hasData.toString());
        } 
        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

    // By default, show a loading spinner.
      return const CircularProgressIndicator();
      },
    );
  }
}


class CarteleraPoster extends StatefulWidget{
  const CarteleraPoster({super.key, required this.cartelera});
  final Cartelera cartelera;

  

  @override
  State<CarteleraPoster> createState() => CarteleraPosterState();
}

class CarteleraPosterState extends State<CarteleraPoster>{
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetails(cartelera: widget.cartelera))
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Expanded(
              flex: 8,
              child: SizedBox(
                width: 200,
                height: 350,
                child: Image.network(widget.cartelera.EVENTO.FOTO, width: 200, height: 350,),
              )  
            ),
            Expanded(
      
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Text.rich(
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: widget.cartelera.EVENTO.NOMBRE,
                        ) 
                      ),
                    Text(widget.cartelera.SALA.NOMBRE, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 12)),
                    Text(widget.cartelera.INICIO, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 12)),
                  ],
                ),
              ))
          ]
        )
      ),
    );
  }
}
class ListViewParking extends StatefulWidget{
  const ListViewParking({super.key});
  
  @override
  State<ListViewParking> createState() => ListViewParkingState();
}

class ListViewParkingState extends State<ListViewParking>{
  
  @override
  Widget build(BuildContext context){
      return SliverList.list(
        
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Colors.red[100],
                child: Padding( padding: const EdgeInsets.only(left: 30, right: 30) ,child: Image.asset('assets/images/ccsxxiextended.png',)),
              )
            ), 
          ],
        );
  }
}

class ListSettings extends StatefulWidget{
  const ListSettings({super.key});
  
  @override
  State<ListSettings> createState() => ListSettingsState();
}

class ListSettingsState extends State<ListSettings>{
  
  @override
  Widget build(BuildContext context){
    return SliverList.list(
      children: const <Widget>[
        ListTile(
          contentPadding: EdgeInsets.only(left: 25,top:10, bottom: 10,right: 25),
          leading: CircleAvatar(child: Icon(Icons.edit)),
          title: Text('Mis Datos',style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Administra tu correo, contraseña, etc'),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 25,top:10, bottom: 10,right: 25),
          leading: CircleAvatar(child: Icon(Icons.credit_card)),
          title: Text('Método de Pago', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Administra tus métodos de pago'),
        ),  
        ListTile(
          contentPadding: EdgeInsets.only(left: 25,top:10, bottom: 10,right: 25),
          leading: CircleAvatar(child: Icon(Icons.notifications)),
          title: Text('Historial de Notificaciones', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Consulta tus notificaciones pasadas'),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 25,top:10, bottom: 10,right: 25),
          leading: CircleAvatar(child: Icon(Icons.settings)),
          title: Text('Ajustes de la Aplicación', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Cambia los ajustes de la aplicación'),
        ),  
        ListTile(
          contentPadding: EdgeInsets.only(left: 25,top:10, bottom: 10,right: 25),
          leading: CircleAvatar(child: Icon(Icons.exit_to_app)),
          title: Text('Cerrar Sesion', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Salir de tu usuario')
        ),
      ],
    );
  }
}

class ListTicket extends StatefulWidget{
  const ListTicket({super.key, required this.cartelera });
  final Cartelera cartelera;
  
  
  @override
  State<ListTicket> createState() => ListTicketState();
}

class ListTicketState extends State<ListTicket>{

  @override
   Widget build(BuildContext context){
    String suma = '${widget.cartelera.SALA.NOMBRE} - ${widget.cartelera.INICIO}';

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetail(cartelera: widget.cartelera))
        );
      },
      child: Padding(
        padding:const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(widget.cartelera.EVENTO.FOTO),  
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.cartelera.EVENTO.NOMBRE, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    Text(suma, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
                    Text(widget.cartelera.INICIO, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14))
                  ],
                ),
              )
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[Icon(Icons.arrow_forward_ios),]
                )
              )
            )
          ],
        ),  
      ),
    );
  }
}




