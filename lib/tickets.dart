import 'package:ccsxxi/searchbar.dart';
import 'package:flutter/material.dart';
import 'namer_app_icons.dart';

class Tickets extends StatefulWidget{
  const Tickets({super.key});
  
  @override
  State<Tickets> createState() => TicketsState();
}

class TicketsState extends State<Tickets>{
  
  @override
  Widget build(BuildContext context){
    return const Card(
      child: Column(
        children:[
          TopSearchBar(),
          Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
               Card(
                child:  ListTile(
                  leading: Icon(Namer_app.ticket_alt),
                  title: Text('Boleto 1'),
                  subtitle: Text('Esto es un boleto'),
                ),
              ),
               Card(
                child:  ListTile(
                  leading: Icon(Namer_app.ticket_alt),
                  title: Text('Boleto 2'),
                  subtitle: Text('Esto es un boleto X2'),
                ),
              ),
            ],
          ),
        )
        ]
        ),   
    );
  }
}