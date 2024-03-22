import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget{
  const MyProfile({super.key});
  
  @override
  State<MyProfile> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile>{
  
  @override
  Widget build(BuildContext context){
    final ThemeData theme = Theme.of(context);
    return Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Aqui va el Perfil del Usuario',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        );
  }
}