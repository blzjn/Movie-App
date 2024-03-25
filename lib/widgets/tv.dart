import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TvShows extends StatelessWidget {
  final List tv;

  TvShows({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular TV Shows ',
            color: Colors.white,
            size: 26,
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: tv[index]['title'].toString(),
                                  description: tv[index]['overview'].toString(),
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                                  vote: tv[index]['vote_average'].toString(),
                                  launch_on: tv[index]['release_date'].toString())));

                    },
                    child: 
                    tv[index]['title']!=null? Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']),
                                            fit: BoxFit.cover
                                            )),
                          ),
                          SizedBox(height: 10,),
                          
                          Container(
                            child: Text(tv[index]['original_name'] != null
                                ? tv[index]['original_name']
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
