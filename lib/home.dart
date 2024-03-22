import 'package:ccsxxi/listview.dart';
import 'package:ccsxxi/spinner.dart';
import 'package:flutter/widgets.dart';
import 'searchbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  
  @override
  Widget build(BuildContext context){
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child:TopSearchBar()),
        SliverToBoxAdapter(child:Spinner()),
        SliverToBoxAdapter(child: TitleHome()),
        ListViewCartelera()
      ]
    );
  }
}


class TitleHome extends StatefulWidget{
  const TitleHome({super.key});
  
  @override
  State<TitleHome> createState() => TitleHomeState();
}

class TitleHomeState extends State<TitleHome>{
  
  @override
  Widget build(BuildContext context){
    return const Row(
        children: <Widget>[
          Expanded(
            child:
            Padding(
              padding: EdgeInsets.all(10),
              child: 
                Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  TextSpan(
                    text: "Cartelera",
                )
              )
            )
          )
        ],
      );
  }

}