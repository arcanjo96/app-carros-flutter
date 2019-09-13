import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  String title;
  Function function;


  Button(this.title, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: RaisedButton(
        onPressed: function,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 22.0),),
        color: Colors.blue,
      ),
    );
  }
}
