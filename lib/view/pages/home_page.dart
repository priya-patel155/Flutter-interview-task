import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/constants/app_colors.dart';
import '../../model/category_movie_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupMovie();
  }

  List<CategoryMovieModel> finalMoviesWithCategory = [];

  _setupMovie() async {
    print('here go');
    Dio dio = Dio();
    Response response = await dio.get(
        'http://myvbox.uk:2052/player_api.php?username=test&password=test1&action=get_vod_categories');
    List<CategoryMovieModel> _tempdata = [];
    for (int i = 0; i < response.data.length; i++) {
      CategoryMovieModel mainModel =
          CategoryMovieModel.fromJson(response.data[i]);
      _tempdata.add(mainModel);
    }
    Response movieresponse = await dio.get(
        'http://myvbox.uk:2052/player_api.php?username=test&password=test1&action=get_vod_streams');
    List<Movie> moviedata = [];
    for (int i = 0; i < movieresponse.data.length; i++) {
      Movie movie = Movie.fromJson(movieresponse.data[i]);
      moviedata.add(movie);
    }
    for (int i = 0; i < _tempdata.length; i++) {
      List<Movie> categoryWiseMovie = moviedata
          .where((element) => element.categoryId == _tempdata[i].categoryId)
          .toList();
      _tempdata[i].movie = categoryWiseMovie;
    }
    setState(() {
      finalMoviesWithCategory = _tempdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.black,
      appBar: AppBar(
        backgroundColor: CustomTheme.black,
        actions: [
          Icon(
            Icons.search,
            color: CustomTheme.white,
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: finalMoviesWithCategory.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: CustomTheme.red,
              ),
            )
          : ListView.builder(
              itemCount: finalMoviesWithCategory.length,
              itemBuilder: (context, index) {
                return _buildMovieWidget(finalMoviesWithCategory[index]);
              }),
    );
  }
}

Widget _buildMovieWidget(CategoryMovieModel finalMoviesWithCategory) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              finalMoviesWithCategory.categoryName.toString(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'See All',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5.w,
      ),
      Container(
        height: 28.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: finalMoviesWithCategory.movie!.length,
            itemBuilder: (context, movieIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60.w,
                  width: 20.w,
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                            finalMoviesWithCategory
                                .movie![movieIndex].streamIcon
                                .toString(),
                            fit: BoxFit.fitWidth),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        '${finalMoviesWithCategory.movie![movieIndex].name}',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }),
      )
    ],
  );
}
