
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hillel/src/models/song_model.dart';

final String url = 'https://hilleldata.herokuapp.com/v1/graphql';

class SongsService {  
  HasuraConnect hasuraConnect = HasuraConnect(url);  
  Future<List<SongModel>> allSongs() async{
    String docQuery = """
      query {
        songs {
            id
            title
            artist
          }
      }
    """;
    var resultQuery =  await hasuraConnect.query(docQuery);
    var results = resultQuery['data']['songs'];
    return SongModel.fromJsonList(results);    
    
  }

}

