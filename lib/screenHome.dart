import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '644b85f04f4d3efe461a5f3e4321a34b';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NDRiODVmMDRmNGQzZWZlNDYxYTVmM2U0MzIxYTM0YiIsInN1YiI6IjY1ZWYxOTk0ZjVjYjIxMDE0ODQ0ZWUyOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8o4e4uwcDs7R1nD-i9fvvfze7onKeQep2EWWbPfi3s0';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    print(trendingresult);

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });

    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(text: 'Flutter Movie App 🎬', color: Colors.white, size: 30,),
      ),
      body: ListView(
        children: [
          TvShows(tv: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
          
        ],
      ),
    );
  }
}
