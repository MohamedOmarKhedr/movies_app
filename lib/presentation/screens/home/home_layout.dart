import 'package:movies_app/business_logic/cubit/app_cubit.dart';
import 'package:movies_app/presentation/style/colors.dart';
import 'package:movies_app/presentation/widgets/default_app_par.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AppCubit _cubit;

  @override
  void didChangeDependencies() {
    _cubit = AppCubit.get(context)
      ..getTV()
      ..getStars()
      ..getMovies();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: DefaultAppBar(title: _cubit.titles[_cubit.currentIndex]),
          body: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [darkRed, Colors.red, lightRed]),
              ),
            ),
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                if (state is AppMoviesLoadingState ||
                    state is AppStarsLoadingState ||
                    state is AppTVLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is AppMoviesSuccessState ||
                    state is AppTVSuccessState ||
                    state is AppStarsSuccessState ||
                    state is ChangeScreensIndexState) {
                  return _cubit.screens[_cubit.currentIndex];
                } else {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.red),
                  );
                }
              },
            )
          ]),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: white,
              unselectedItemColor: black,
              elevation: 0,
              currentIndex: _cubit.currentIndex,
              onTap: (index) => _cubit.changeScreensIndex(index),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.movie_creation_outlined,
                    ),
                    label: _cubit.titles[0],
                    backgroundColor: darkRed),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.tv),
                    label: _cubit.titles[1],
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.star),
                  label: _cubit.titles[2],
                  backgroundColor: lightRed,
                ),
              ]),
        );
      },
    );
  }
}
