import 'package:flutter/material.dart';
import 'package:hillel/src/models/song_model.dart';
import 'package:hillel/src/services/songs_service.dart';

class SongSearch extends SearchDelegate<SongModel> {
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
    // var results = songs
    //     .where((a) => a.title.toLowerCase().contains(query.toLowerCase()));

    return FutureBuilder(
      future: songsService.allSongs(),
      builder: (context, AsyncSnapshot<List<SongModel>> snapshot) {
        List<SongModel> songs = snapshot.data;
        return ListView(
          children: songs
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
      },
    );
  }

  SongsService songsService = SongsService();

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    return FutureBuilder(
      future: songsService.titleContains(str: query),
      builder: (context, AsyncSnapshot<List<SongModel>> snapshot) {
        if (!snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.data.length == 0) {
          return Column(
            children: <Widget>[
              Text(
                "No Results Found.",
              ),
            ],
          );
        } else {
          List<SongModel> songs = snapshot.data;
          return ListView(
            children: songs
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
      },
    );
  }
}
