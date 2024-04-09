import 'package:ccsxxi/models/cartelera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventDetails extends StatefulWidget{
  const EventDetails({super.key, required this.cartelera});
  final Cartelera cartelera;

  @override
  State<EventDetails> createState() => EventDetailsState();
}

class EventDetailsState extends State<EventDetails>{
  
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
            SliverToBoxAdapter(child:DatosGenerales(cartelera: widget.cartelera)),
            SliverToBoxAdapter(child:Sinopsis(cartelera: widget.cartelera)),

          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            
          });
        },
        label: const Text("Comprar Boletos"),
        icon: const Icon(Icons.shopping_cart_checkout),
      ),
      ) 
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
    return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      child: Image.network(widget.cartelera.EVENTO.FOTO, width: 200, height: 220,),
                    )  
                  ),
                  Expanded(
                    flex:8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.cartelera.EVENTO.NOMBRE, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
                        const Text('Lugar:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                        Text(widget.cartelera.SALA.NOMBRE, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
                        const Text('Fecha:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                        Text(widget.cartelera.INICIO, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),

                    ],
                                  ),
                  ),
                ],
              );
  }
}

class Sinopsis extends StatefulWidget{
  const Sinopsis({super.key, required this.cartelera});
  final Cartelera cartelera;
  final String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tristique hendrerit nisi vitae sollicitudin. Sed et imperdiet justo. Ut aliquam porta dignissim. Pellentesque pellentesque ligula non erat laoreet fringilla. Integer rutrum ultricies metus sed tempus. Proin scelerisque maximus nunc, sed congue nulla cursus in. Sed ac volutpat lacus. Praesent turpis metus, tristique quis euismod quis, convallis id purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec libero quam, consectetur varius lectus eget, volutpat commodo felis. Nullam in ante condimentum, rutrum lectus mattis, blandit mi. Duis euismod eget felis at mattis.';

  @override 
  State<Sinopsis> createState() => SinopsisState();
}

class SinopsisState extends State<Sinopsis>{
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sinopsis:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text(widget.lorem, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14)),
              ]
            )
          )
        ],
      ),
    );
  }
}

