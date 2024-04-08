import 'package:ccsxxi/listview.dart';
import 'package:ccsxxi/models/cartelera.dart';
import 'searchbar.dart';
import 'package:flutter/material.dart';
//import 'namer_app_icons.dart';

class Tickets extends StatefulWidget{
  const Tickets({super.key});
  
  @override
  State<Tickets> createState() => TicketsState();
}

class TicketsState extends State<Tickets>{
  
  @override
  Widget build(BuildContext context){
    return const Column(
        children:[
         TopSearchBar(),
          Expanded(
              child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child:TicketTitle(),),
                SliverToBoxAdapter(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children:  <Widget>[
                      ListTicket(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
                      ListTicket(cartelera:  Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
                      ListTicket(cartelera:  Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
                    ],
                  ),
                )
              )
            ]
          )
        ),
          
      ]
    );
  }
}

class TicketTitle extends StatefulWidget{
  const TicketTitle({super.key});
  
  @override
  State<TicketTitle> createState() => TicketTitleState();
}

class TicketTitleState extends State<TicketTitle>{
  
  @override
  Widget build(BuildContext context){
    return const Row(
        children: <Widget>[
          Expanded(
            child:
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10,right: 15),
              child: 
                Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  TextSpan(
                    text: "Mis Boletos",
                )
              )
            )
          )
        ],
      );
  }

}   

