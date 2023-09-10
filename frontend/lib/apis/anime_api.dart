import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:frontend/apis/url.dart';
import 'package:frontend/models/anime_model.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/utils/navigator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> insertAnime(String title, File file, int episodes, String description) async {
    const insertAnimeUrl = "$url/animes";

    var request = http.MultipartRequest("POST", Uri.parse(insertAnimeUrl));
    request.files.add(await http.MultipartFile.fromPath("image", file.path));
    request.fields["title"] = title;
    request.fields["episodes"] = episodes.toString();
    request.fields["description"] = description;

    var response = await request.send();

    var res = await response.stream.bytesToString();
    var result = await json.decode(res);
    if(response.statusCode == 200){
      return null;
    }

    return result["message"] as String;
}

Future<List<AnimeModel>> fetchAllAnimes(BuildContext context) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String token = sp.getString("token")!;
  String fetchAllAnimeUrl = "$url/animes?token=$token";

  List<AnimeModel> animeList = [];

  http.Response response = await http.get(Uri.parse(fetchAllAnimeUrl));

  var result = json.decode(response.body);

  if(response.statusCode == 200){
    for (var e in result){
      AnimeModel animeModel = AnimeModel.fromJson(e);
      animeList.add(animeModel);
    }
  }

  if(response.statusCode == 400) {
    logOut(context);
  }

  return animeList;
}


void logOut(BuildContext context) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.remove("token");
  navigate(context, const LoginPage(), false);
}