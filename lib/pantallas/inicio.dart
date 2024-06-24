import 'dart:convert';
// https://jsonplaceholder.typicode.com/
import 'package:app_aprender_api_rest/pantallas/detalles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class PantallaInicio extends StatefulWidget {
  @override

  _PantallaInicioState createState()=> _PantallaInicioState();


}

class _PantallaInicioState extends State<PantallaInicio> {
  List data = [];//inicializa la lista que cotendra la informacion inicial
  bool isLoadnig = true; // para manejar el estado de carga

  //conectarnos al sitio
  @override
  void initState(){
    super.initState();
    fetchData();
  }

  //metodo para conectar con servidor
  fetchData() async{//capturar la informacion del sitio de donde vanis a tener la informacion
    final response= 
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      setState(() {
        data = json.decode(response.body);
        isLoadnig=false;
      });
    } else {
      throw Exception('Carga de datos fallidos');
    }
  }

  // para diseño y para conectar informacion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Text('Menu', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ),
      ),
      body: isLoadnig
        ? Center(
          child: CircularProgressIndicator())
          :ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:  Text(data[index]['title']),
                subtitle:  Text(data[index]['body']),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context)=>
                        PantallaDetalles(post: data[index])
                      )
                    );
                },
              );
            },
          ),
        );
  }
  
}