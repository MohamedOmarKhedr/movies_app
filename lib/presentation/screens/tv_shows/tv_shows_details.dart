import 'package:flutter/material.dart';
import 'package:movies_app/business_logic/cubit/app_cubit.dart';
import 'package:movies_app/data/remote_data/responses/tv_response.dart';
import 'package:movies_app/presentation/style/colors.dart';
import 'package:movies_app/presentation/widgets/default_app_par.dart';
import 'package:movies_app/presentation/widgets/default_network_image.dart';
import 'package:movies_app/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class TVShowsDatailsScreen extends StatelessWidget {
  final TVResults tvModel;
  const TVShowsDatailsScreen({super.key, required this.tvModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tvModel.name ?? '',
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [darkRed, Colors.red, lightRed]),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 2.h,
                        bottom: 1.h,
                      ),
                      child: DefaultNetworkImage(
                          imageURL: AppCubit.get(context)
                              .imageURL(imagePath: tvModel.backdropPath ?? '')),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DefaultText(
                          text: "${tvModel.overview}",
                          textSize: 15.sp,
                          weight: FontWeight.bold,
                          textColor: white,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
