import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/cubit/app_cubit.dart';
import 'package:movies_app/data/remote_data/responses/movies_response.dart';
import 'package:movies_app/presentation/style/colors.dart';
import 'package:movies_app/presentation/widgets/default_network_image.dart';
import 'package:movies_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app/core/screens.dart' as screens;

class MoviesListItem extends StatelessWidget {
  final MovieResults movieModel;

  const MoviesListItem({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          screens.moviesDatailsScreen,
          arguments: movieModel,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: DefaultText(
                text: "${movieModel.title}",
                textSize: 18.sp,
                weight: FontWeight.bold,
                textColor: lightRed,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 2.h,
                  bottom: 1.h,
                ),
                child: DefaultNetworkImage(
                    imageURL: AppCubit.get(context)
                        .imageURL(imagePath: movieModel.posterPath ?? '')),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: DefaultText(
                    text: "${movieModel.overview}",
                    textSize: 12.sp,
                    weight: FontWeight.bold,
                    textColor: white,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
