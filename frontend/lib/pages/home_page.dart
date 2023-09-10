import 'package:flutter/material.dart';
import 'package:frontend/apis/anime_api.dart';
import 'package:frontend/models/anime_model.dart';
import 'package:frontend/pages/detail_page.dart';
import 'package:frontend/pages/insert_page.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<AnimeModel>> animeList;

  @override
  void initState() {
    super.initState();
    animeList = fetchAllAnimes(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: secondaryColor,
      ),
      body: FutureBuilder(future: animeList, builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        var data = snapshot.data;
        print(data);
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (data.isEmpty) {
          return const Center (
            child: Text("Anime list empty"),
          );
        }

        return ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              AnimeModel animeModel = data[index];
              return ListTile(
                onTap: (){
                  navigate(context, const DetailPage(), true);
                },
                leading: Image.network(animeModel.image),
                title: Text(animeModel.title),
                subtitle: Text("Episodes: ${animeModel.episodes}"),
              );
            }));
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigate(context, const InsertPage(), true);
        },
        backgroundColor: secondaryColor,
        focusColor: fontColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
