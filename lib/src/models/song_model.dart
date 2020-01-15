class SongModel {
  String title;
  String artist;
  int id;

  SongModel({this.id,this.title,this.artist});

  factory SongModel.fromJson(Map<String, dynamic> json) => new SongModel(    
        id: json["id"],  
        title: json["title"],
        artist: json["title"],
    );

    Map<String, dynamic> toJson() => {      
        "title": title,
        "id": id,
        "title": artist,
    };

    static List<SongModel> fromJsonList(List list){      
      if(list == null) return null;
      return list
        .map((item) => SongModel.fromJson(item))
        .toList();
    }
}     