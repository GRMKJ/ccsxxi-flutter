import 'package:flutter/material.dart';

class ListViewCartelera extends StatefulWidget{
  const ListViewCartelera({super.key});
  
  @override
  State<ListViewCartelera> createState() => ListViewCarteleraState();
}

class ListViewCarteleraState extends State<ListViewCartelera>{
  
  @override
  Widget build(BuildContext context){
      return SliverList.list(
        children: <Widget>[
            Container(
              height: 200,
              color: Colors.red[600],
              child: const Center(child: Text('Pelicula A')),
            ),
            Container(
              height: 200,
              color: Colors.red[500],
              child: const Center(child: Text('Pelicula B')),
            ),
            Container(
              height: 200,
              color: Colors.red[100],
              child: const Center(child: Text('Pelicula C')),
            ),  
          ],
        );
  }
}