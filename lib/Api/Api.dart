import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:youtube/models/VideoModel.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDKKDcFjEpzwUgHY5RHC1J7vGUTKSaJnMk";
const ID_CANAL = "UCdlJx-w37viXFNq__qZ7ARQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";



class Api {

   Future<List<VideoModel>> pesquisar(String pesquisa) async {

    Uri URL_BASE_SEARCH = Uri.parse(
      URL_BASE+"search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL"
      "&q=$pesquisa"
    );

    http.Response response = await http.get(
      URL_BASE_SEARCH
    );

    List<VideoModel> videos;

    if(response.statusCode == 200){
      
      Map<String, dynamic> dadosJson = json.decode(response.body);

       videos = dadosJson["items"].map<VideoModel>(
        (map) {
          return VideoModel.fromJson(map);
        }
      ).toList();
      
      
      
      return videos;

    } else {
      return videos = [];
    }

  

    

  
    

  }

}