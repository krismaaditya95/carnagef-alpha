import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {

  final MovieEntity movieEntity;
  final Function() callback;

  const MovieTile({super.key,
    required this.movieEntity,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 0),
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(0,1)
          )
        ]
      ),
      child: InkWell(
        onTap: () => callback(),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/original/${movieEntity.posterPath}',
                width: 100,
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10,top: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movieEntity.title.toString(), softWrap: true, overflow: TextOverflow.clip, textAlign: TextAlign.justify,),
                    Text('Release Date : ${movieEntity.releaseDate}'),

                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                          movieEntity.overview.toString().trim(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 4,
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                    ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
