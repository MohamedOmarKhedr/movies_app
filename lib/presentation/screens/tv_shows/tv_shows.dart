import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/cubit/app_cubit.dart';
import 'package:movies_app/presentation/views/tv_shows_list_item.dart';
import 'package:sizer/sizer.dart';

class TVShowsScreen extends StatefulWidget {
  const TVShowsScreen({super.key});

  @override
  State<TVShowsScreen> createState() => _TVShowsScreenState();
}

class _TVShowsScreenState extends State<TVShowsScreen> {
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
            itemCount: _cubit.tvResponse.results.length,
            itemBuilder: (context, index) => TVShowsListItem(
                  tvModel: _cubit.tvResponse.results[index],
                )));
  }
}
