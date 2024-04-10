import 'package:ccsxxi/login.dart';

import 'listview.dart';
import 'spinner.dart';
import 'searchbar.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;


class Home extends StatefulWidget{
  const Home({super.key});
  

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  
  @override
  Widget build(BuildContext context){
      return const Column(
        children: [
          TopSearchBar(),
          Expanded(
              child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child:Spinner()),
                SliverToBoxAdapter(child:TitleHome()),
                ListViewCarteleraP()
              ]
            )
          )
        ],
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
            flex: 7,
            child:
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10,right: 15),
              child: 
                Text.rich(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  TextSpan(
                    text: "Cartelera",
                )
              )
            )
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10,right: 10),
              child: SingleChoice(),
            ))
        ],
      );
  }

}   

enum Calendar { poster, details }
class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.poster;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.poster,
            icon: Icon(Icons.remember_me_rounded)),
        ButtonSegment<Calendar>(
            value: Calendar.details,
            icon: Icon(Icons.view_list_rounded)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }
}
