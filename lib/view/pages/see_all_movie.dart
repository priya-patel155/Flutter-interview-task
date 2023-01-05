import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/category_movie_model.dart';

class SeeAllMovie extends StatefulWidget {
  final CategoryMovieModel? finalMoviesWithCategory;
  SeeAllMovie({Key? key, this.finalMoviesWithCategory}) : super(key: key);

  @override
  State<SeeAllMovie> createState() => _SeeAllMovieState();
}

class _SeeAllMovieState extends State<SeeAllMovie> {
  @override
  Widget build(BuildContext context) {
    print('${widget.finalMoviesWithCategory!.movie![0].name}');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          '${widget.finalMoviesWithCategory!.categoryName}',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.finalMoviesWithCategory!.movie!.length,
                  itemBuilder: (context, movieIndex) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                              child: widget.finalMoviesWithCategory!
                                          .movie![movieIndex].streamIcon !=
                                      null
                                  ? Image.network(
                                      widget.finalMoviesWithCategory!
                                          .movie![movieIndex].streamIcon
                                          .toString(),
                                      fit: BoxFit.fitWidth)
                                  : Container()),
                          title: Text(
                            '${widget.finalMoviesWithCategory!.movie![movieIndex].name}',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    );

                    //   Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: 60.w,
                    //     width: 20.w,
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           child: Image.network(
                    //               widget.finalMoviesWithCategory!
                    //                   .movie![movieIndex].streamIcon
                    //                   .toString(),
                    //               fit: BoxFit.fitWidth),
                    //         ),
                    //         SizedBox(
                    //           height: 5.w,
                    //         ),
                    //         Text(
                    //           '${widget.finalMoviesWithCategory!.movie![movieIndex].name}',
                    //           style:
                    //               TextStyle(fontSize: 10, color: Colors.white),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
