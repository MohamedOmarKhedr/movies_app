import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/cubit/app_cubit.dart';
import 'package:movies_app/presentation/views/movies_list_item.dart';
import 'package:sizer/sizer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late AppCubit _cubit;

  @override
  void didChangeDependencies() {
    _cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.sp),
        child: ListView.separated(
            separatorBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                        child: Divider(
                      height: 1.h,
                      color: Colors.black45,
                    ))
                  ],
                ),
            itemCount: _cubit.moviesResponse.results.length,
            itemBuilder: (context, index) => MoviesListItem(
                  movieModel: _cubit.moviesResponse.results[index],
                )));
  }
}
