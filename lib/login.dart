import 'dart:convert';

import 'package:ccsxxi/models/users.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'globals.dart' as globals;

class Login extends StatefulWidget{
  const Login({super.key});
  
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login>{
  final _formKey = GlobalKey<FormState>();
  late Future<LoginResponse> loginResponse; 
  late LoginResponse loginres;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<LoginResponse> fetchUser() async {
    String userParam = emailController.text;
    String passParam = passwordController.text;
    final response = await http.get(Uri.parse('https://minitechsolutions.shop/ccsxxitest/api/login.php?userParam=$userParam&passParam=$passParam')); // Reemplaza 'URL_DEL_WEBSERVICE' por la URL de tu web service

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body)); // Analiza la respuesta JSON y crea un objeto Estudiante
    } 
    else {
      globals.isLoggedIn = false;
      throw Exception('Error al cargar datos');
    }
  }

  Future catchUser() async{
    loginres = await fetchUser();
    if(loginres.estatus == true){
                              globals.isLoggedIn = true;
                              globals.userRealName = "${loginres.usuario.PERSONA.NOMBRE} ${loginres.usuario.PERSONA.A_PATERNO} ${loginres.usuario.PERSONA.A_MATERNO}";
                              globals.username = "${loginres.usuario.USERNAME}";
                              globals.mail = "${loginres.usuario.CORREO}";
                              Navigator.pop(context);
                            }
  }


  @override
  Widget build(BuildContext context){
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),
                   TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                            catchUser();
                          } 
                      else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill input')),
                            );
                          }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
      ),
    ),
  );
  }
  
}