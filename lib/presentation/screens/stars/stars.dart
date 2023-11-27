import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/cubit/app_cubit.dart';
import 'package:movies_app/presentation/views/stars_list_item.dart';
import 'package:sizer/sizer.dart';

class StarsScreen extends StatefulWidget {
  const StarsScreen({super.key});

  @override
  State<StarsScreen> createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen> {
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
            itemCount: _cubit.starsResponse.results.length,
            itemBuilder: (context, index) => StarsListItem(
                  starModel: _cubit.starsResponse.results[index],
                )));
  }
}
