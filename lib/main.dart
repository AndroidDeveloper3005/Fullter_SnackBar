import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);


class MyApp extends StatefulWidget{
  @override
  MyState createState()  =>new MyState();

}
class MyState extends State<MyApp>{
  String _text= "";

  void _onChange(String value){
    setState(() {
      _text = value;
    });
  }
//GlobalKey is a uniqe key accros the intair application
  final GlobalKey<ScaffoldState>_scafholdState = new GlobalKey<ScaffoldState>();

  void _showSnackBar(String value){
    if(value.isEmpty)return;
    _scafholdState.currentState.showSnackBar(
      new SnackBar(content: new Text(value)));
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      key: _scafholdState,
      appBar: new AppBar(
        title: new Text("SnakBar"),

      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                  onChanged: (String value){
                    _onChange(value);
              }

              ),
              new RaisedButton(
                onPressed: (){
                  _showSnackBar(_text);
                },
                child: new Text("SnackBar"),

              ),
            ],
          ),
        ),
      ),
    );
  }

}

