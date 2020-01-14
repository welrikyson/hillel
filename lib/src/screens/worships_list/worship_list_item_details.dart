import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hillel/src/screens/worships_list/search_item.dart';
import 'package:hillel/src/screens/worships_list/worship_list_preview.dart';

class WorshipListItemDetails extends StatefulWidget {
  final Item item;

  const WorshipListItemDetails({Key key, this.item}) : super(key: key);
  @override
  _WorshipListItemDetailsState createState() => _WorshipListItemDetailsState();
}

class _WorshipListItemDetailsState extends State<WorshipListItemDetails> {
  //String dropdownStyleValue = 'Oferta';
  Future<void> openSearcherSongs() async {
    var result = await showSearch(
      context: context,
      delegate: ItemSearch(
        items: UnmodifiableListView(MockItens().getAll()),
      ),
    );
    if (result != null) {
      setState(() {
        widget.item.title = result.title;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              isDense: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'moment',
                prefixIcon: Icon(Icons.category),
              ),
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
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: TextEditingController(
                text: widget.item.title,
              ),
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'song',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.music_note),
                hintText: 'song',
                suffixIcon: Icon(Icons.library_music),
              ),
              onChanged: (String newValue) {
                setState(() {
                  widget.item.title = newValue;
                });
              },
              onTap: openSearcherSongs,
            ),
          ],
        ),
      ),
    );
  }
}
