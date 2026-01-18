
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/Home/presentation/manager/similar%20book%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/home_page_view.dart';
import 'package:bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/Features/search/view/search_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kSplashView = '/';
  static const kHomePage = '/homepage';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView ';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomePage, builder: (context, state) => const HomePage()),
      GoRoute(
        path: kBookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(
                getIt.get<HomeRepoImpl>()
              ),
              child: BookDetailsView(
                book: state.extra as BookModel,
              ),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
