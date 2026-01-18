import 'package:bookly_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/Home/presentation/manager/best%20seller%20cubit/best_seller_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/manager/horizontal%20cubit/horizontal_books_cubit.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/manager/search%20book%20cubit/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/view/search_view.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HorizontalBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchHorizontalBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BestSellerCubit(getIt.get<HomeRepoImpl>())
                ..fetchBestSellerBookHome(),
        ),
        BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
          scaffoldBackgroundColor: kPrimaryColors,
        ),
      ),
    );
  }
}
