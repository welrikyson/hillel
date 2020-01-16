
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hillel/src/models/song_model.dart';

final String url = 'https://hilleldata.herokuapp.com/v1/graphql';

class SongsService {  
  HasuraConnect hasuraConnect = HasuraConnect(url);  
  Future<List<SongModel>> allSongs() async{
    String docQuery = """
      {
        songs {
            id
            title
            artist
          }
      }
    """;
    var resultQuery =  await hasuraConnect.query(docQuery);
    var results = resultQuery['data']['songs'];
    print(results.toString());
    return SongModel.fromJsonList(results);        
  }

  Future<List<SongModel>> titleContains({String str}) async{
    const strName = 'strN';
    String docQuery = """
      query MyQuery {
  songs(where: {title: {_like: "$str%"}}) {
    id
    title
    artist
  }
}
    """;    
    var resultQuery =  await hasuraConnect.query(docQuery); //, variables: {strName:  str}
    var results = resultQuery['data']['songs'];
    print(results.toString());
    return SongModel.fromJsonList(results);        
  }

}
