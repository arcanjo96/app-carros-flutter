import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  String title;
  Function function;
  bool showProgress;

  Button(this.title, this.function, {this.showProgress = false });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: RaisedButton(
        onPressed: function,
        child: showProgress ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),) : Text(title, style: TextStyle(color: Colors.white, fontSize: 22.0),),
        color: Colors.blue,
      ),
    );
  }
}
