import 'package:flutter/material.dart';
import 'package:hillel/src/screens/worships_list/worship_list_preview.dart';

class WorshipListItemDetails extends StatefulWidget {
  final Item item;

  const WorshipListItemDetails({Key key, this.item}) : super(key: key);
  @override
  _WorshipListItemDetailsState createState() => _WorshipListItemDetailsState();
}

class _WorshipListItemDetailsState extends State<WorshipListItemDetails> {
  //String dropdownStyleValue = 'Oferta';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            DropdownButtonFormField<String>(
              isDense: true,
              decoration: InputDecoration(
                  labelText: 'moment', prefixIcon: Icon(Icons.category)),
              value: widget.item.style,
              icon: Icon(Icons.arrow_drop_down),
              hint: Text('Tipo lavagem'),
              onChanged: (String newValue) {
                setState(() {
                  widget.item.style = newValue;
                });
              },
              items: <String>[
                'Manual',
                'Oferta',
                'Visitante',
                'Adoração',
                'Celebração',
                'Comunhão',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField<String>(
              isDense: true,
              decoration: InputDecoration(
                  labelText: 'song', prefixIcon: Icon(Icons.music_note)),
              value: widget.item.style,
              icon: Icon(Icons.arrow_drop_down),
              hint: Text('Tipo lavagem'),
              onChanged: (String newValue) {
                setState(() {
                  widget.item.style = newValue;
                });
              },
              items: <String>[
                'Manual',
                'Oferta',
                'Visitante',
                'Adoração',
                'Celebração',
                'Comunhão',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
