class VideoModel {

  var id;
  var title;
  var description;
  var image;
  var channel;

  VideoModel({this.id, this.title, this.description, this.image, this.channel});

  // static converterJson(Map<String, dynamic> json) {
  //   return VideoModel(
  //     id: json["id"]["videoId"],
  //     title: json["snippet"]["title"],
  //     description: json["snippet"]["description"],
  //     image: json["snippet"]["thumbnails"]["high"]["url"],
  //     channel: json["snippet"]["channelId"]
  //   );
  // }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"]
    );
  }

}