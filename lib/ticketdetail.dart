import 'package:ccsxxi/models/cartelera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TicketDetail extends StatefulWidget{
  const TicketDetail({super.key, required this.cartelera});
  final Cartelera cartelera;

  @override
  State<TicketDetail> createState() => TicketDetailState();
}

class TicketDetailState extends State<TicketDetail>{
  
  @override
  Widget build(BuildContext context){
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white, // navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers:[ 
            SliverToBoxAdapter(child:Image.asset('assets/images/index.png')),
            SliverToBoxAdapter(child:Poster(cartelera: widget.cartelera)),
            SliverToBoxAdapter(child:DatosGenerales(cartelera: widget.cartelera)),
            SliverToBoxAdapter(child:QrCode(cartelera: widget.cartelera)),

          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            
          });
        },
        label: const Text("Estacionamiento"),
        icon: const Icon(Icons.local_parking),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
      ) 
    );
  }
}

class Poster extends StatefulWidget{
  const Poster({super.key, required this.cartelera});
  final Cartelera cartelera;
  

  @override
  State<Poster> createState() => PosterState();
}

class PosterState extends State<Poster>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(widget.cartelera.EVENTO.FOTO)],
      ),
    );
  }
} 

class DatosGenerales extends StatefulWidget{
  const DatosGenerales({super.key, required this.cartelera});
  final Cartelera cartelera;

  @override
  State<DatosGenerales> createState() => DatosGeneralesState();
}

class DatosGeneralesState extends State<DatosGenerales>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top:10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.cartelera.EVENTO.NOMBRE, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
          const Text('Lugar:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
          Text(widget.cartelera.SALA.NOMBRE, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
          const Text('Fecha:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
          Text(widget.cartelera.INICIO, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
          const Text('Hora:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
      ],
        ),
    );
  }
}

class QrCode extends StatefulWidget{
  const QrCode({super.key, required this.cartelera});
  final Cartelera cartelera;
  final String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tristique hendrerit nisi vitae sollicitudin. Sed et imperdiet justo. Ut aliquam porta dignissim. Pellentesque pellentesque ligula non erat laoreet fringilla. Integer rutrum ultricies metus sed tempus. Proin scelerisque maximus nunc, sed congue nulla cursus in. Sed ac volutpat lacus. Praesent turpis metus, tristique quis euismod quis, convallis id purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec libero quam, consectetur varius lectus eget, volutpat commodo felis. Nullam in ante condimentum, rutrum lectus mattis, blandit mi. Duis euismod eget felis at mattis.';

  @override 
  State<QrCode> createState() => QrCodeState();
}

class QrCodeState extends State<QrCode>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/qr.png",width: 200, height: 200,),
              ]
            )
          )
        ],
      ),
    );
  }
}

