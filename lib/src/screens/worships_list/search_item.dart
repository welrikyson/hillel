import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hillel/src/screens/worships_list/worship_list_preview.dart';

class ItemSearch extends SearchDelegate<Item> {
  final UnmodifiableListView<Item> items;

  ItemSearch({this.items});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var results = items
        .where((a) => a.title.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results
          .map<ListTile>((a) => ListTile(
                title: Text(a.title,
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 16.0)),
                leading: Icon(Icons.book),
                onTap: () async {
                  // if (await canLaunch(a.url)) {
                  //   await launch(a.url);
                  // }
                  close(context, a);
                },
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = items
        .where((a) => a.title.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results
          .map<ListTile>((a) => ListTile(
                title: Text(a.title,
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          fontSize: 16.0,
                          color: Colors.blue,
                        )),
                onTap: () {
                  close(context, a);
                },
              ))
          .toList(),
    );
  }
}
