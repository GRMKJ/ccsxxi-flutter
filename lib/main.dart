import 'package:flutter/material.dart';
import 'namer_app_icons.dart';
import 'home.dart';
import 'tickets.dart';
import 'parking.dart';
import 'myprofile.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Color.fromARGB(255, 249, 233, 238),
    statusBarColor: Colors.transparent,
  ));
  if(globals.isLoggedIn!=true){
    runApp(const MyApp());
  }
  else{
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCSXXI - Inicio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const BarraNavegacion(),
    );
  }
}



class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({super.key});

  @override
  State<BarraNavegacion> createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int currentPageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color.fromARGB(255, 249, 233, 238), // navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 238, 142, 135),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Namer_app.event),
            icon: Icon(Namer_app.event),
            label: 'Cartelera',
          ),
          NavigationDestination(
            icon: Icon(Namer_app.ticket_alt),
            label: 'Mis Boletos',
          ),
          NavigationDestination(
            icon: Icon(Namer_app.parking),
            label: 'Estacionamiento',
          ),
          NavigationDestination(
            icon: Icon(Namer_app.user_circle),
            label: 'Mi Perfil',
          ),
        ],
      ),
      
      
      body: SafeArea( 
        child: <Widget>[
        // Home
        const Home(),

        /// My Tickets
        const Tickets(),

        /// Estacionamiento
        const Parking(),

        /// Mi Perfil
        const MyProfile()

      ][currentPageIndex],
      )
    )
    );
  }
}

