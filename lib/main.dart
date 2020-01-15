import 'package:flutter/material.dart';
import 'package:hillel/src/screens/worships_list/worship_list_preview.dart';
import 'package:hillel/src/services/songs_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hillel',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hillel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key); 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 

  void _doAnything() async{
    var songs = await SongsService().allSongs();
    
    setState(() {      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Center(        
        child: WorshipListPreview(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _doAnything,
        tooltip: 'Increment',
        child: Icon(Icons.add),        
      ),
    );
  }
}
