import 'package:flutter/material.dart';

class PantallaDetalles extends StatelessWidget {
  final dynamic post;

  PantallaDetalles({Key? key, required this.post }):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post['title'],
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Text(post['body']),
          ],
        ),
      ),
    );
  }
}