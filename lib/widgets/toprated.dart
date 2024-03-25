import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Top Rated Movies ',
            color: Colors.white,
            size: 26,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'].toString(),
                                  description: toprated[index]['overview'].toString(),
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                                  vote: toprated[index]['vote_average'].toString(),
                                  launch_on: toprated[index]['release_date'].toString())));
                    },
                    child: 
                   toprated[index]['title']!=null? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']))),
                          ),
                          Container(
                            child: Text(toprated[index]['title'] != null
                                ? toprated[index]['title']
                                : 'Loading'),
                          )
                        ],
                      ),
                    ):Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
