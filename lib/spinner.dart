import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Spinner extends StatefulWidget{
  const Spinner({super.key});
  
  @override
  State<Spinner> createState() => TicketsState();
}

class TicketsState extends State<Spinner>{
  
  @override
  Widget build(BuildContext context){
    return  CarouselSlider(
          options: CarouselOptions(height: 300.0),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.red
                  ),
                  child: Text('Pelicula $i', style: const TextStyle(fontSize: 16.0))
                );
              },
            );
          }).toList(),
    );
  }
}