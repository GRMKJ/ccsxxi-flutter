import 'package:ccsxxi/eventdetail.dart';
import 'package:ccsxxi/ticketdetail.dart';
import 'package:flutter/material.dart';
import 'package:ccsxxi/models/cartelera.dart';

class ListViewCarteleraP extends StatefulWidget{
  const ListViewCarteleraP({super.key});
  

  @override
  State<ListViewCarteleraP> createState() => ListViewCarteleraPState();
}

class ListViewCarteleraPState extends State<ListViewCarteleraP>{

  @override
  Widget build(BuildContext context){
      return SliverPadding(
      padding: const EdgeInsets.only(left:10, right: 10),
      sliver: SliverGrid.count( 
        childAspectRatio: .475, 
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
        children: const [
          CarteleraPoster(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
          CarteleraPoster(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
          CarteleraPoster(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
          CarteleraPoster(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
          CarteleraPoster(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png')),
          CarteleraPoster(cartelera: Cartelera('Aquaman and the Lost Kingdom','Sala de Cine CCSXXI','01/01/2020','20:00 - 21:00','assets/images/poster.png','assets/images/banner.png'))
        ],
      )
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
                child: Image.asset(widget.cartelera.poster, width: 200, height: 350,),
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
                          text: widget.cartelera.evento,
                        ) 
                      ),
                    Text(widget.cartelera.lugar, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 12)),
                    Text(widget.cartelera.fecha, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 12)),
                    Text(widget.cartelera.hora, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 12))
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
    String suma = '${widget.cartelera.lugar} - ${widget.cartelera.fecha}';

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
              child: Image.asset(widget.cartelera.poster),  
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.cartelera.evento, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    Text(suma, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
                    Text(widget.cartelera.hora, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14))
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




