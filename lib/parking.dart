import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'searchbar.dart';
import 'listview.dart';
//import 'models/zone.dart';


class Parking extends StatefulWidget{
  const Parking({super.key});
  @override
  State<Parking> createState() => ParkingState();
}

class ParkingState extends State<Parking>{
  
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const TopSearchBar(),
        Expanded(
            child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child:ParkingTitle()),
              const ListViewParking(),
              const SliverToBoxAdapter(child:ZoneTitle()),
              SliverPadding(
                padding: const EdgeInsets.only(left:10, right: 10),
                sliver: SliverGrid.count(  
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    ZoneCard(),
                    ZoneCard(),
                    ZoneCard(),
                    ZoneCard(),
                  ],
                )
              )
            ]
          )
        ),
      ],
    );
  }
}

class ParkingTitle extends StatefulWidget{
  const ParkingTitle({super.key});
  
  @override
  State<ParkingTitle> createState() => ParkingTitleState();
}

class ParkingTitleState extends State<ParkingTitle>{
  
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
                    text: "Estacionamiento",
                )
              )
            )
          )
        ],
      );
  }
} 

class ZoneTitle extends StatefulWidget{
  const ZoneTitle({super.key});
  
  @override
  State<ZoneTitle> createState() => ZoneTitleState();
}

class ZoneTitleState extends State<ZoneTitle>{
  
  @override
  Widget build(BuildContext context){
    return const Row(
        children: <Widget>[
          Expanded(
            child:
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: 
                Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  TextSpan(
                    text: "Zona",
                )
              )
            )
          )
        ],
      );
  }
} 

class ZoneCard extends StatefulWidget{
  const ZoneCard ({super.key, /*required this.zones*/});
  //final List<Zone> zones;

  @override
  State<ZoneCard> createState() => ZoneCardState();
}
class ZoneCardState extends State<ZoneCard> {

  @override
  Widget build(BuildContext context){
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
        child: Column(
          children: [
            Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                  TextSpan(
                    text: "A",
                )
            ),
            Text.rich(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  TextSpan(
                    text: "10 Libres",
                )
            ),
            Row(
              children: [
                Icon(Icons.accessible, color: Colors.black,size:24),
                Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  TextSpan(
                    text: "10 Libres",
                  )
                )
              ],
              )
            ],
          ),
        )  
      )
    );
  }
}