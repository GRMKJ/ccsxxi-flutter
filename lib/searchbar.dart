import 'namer_app_icons.dart';
import 'package:flutter/material.dart';


class TopSearchBar extends StatefulWidget{
  const TopSearchBar({super.key});
  
  @override
  State<TopSearchBar> createState() => TopSearchBarState();
}

class TopSearchBarState extends State<TopSearchBar>{
  
  @override
  Widget build(BuildContext context){
    return Padding(
            padding: const EdgeInsets.all(20.20),
            child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                hintText: "Buscar en Eventos",
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                trailing: const <Widget>[
                  Icon(Namer_app.vke62101, size: 32, color: Colors.red)
                ],
              );
            }, 
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
          );
    }
}