import 'package:bookly_app/Features/Home/presentation/manager/horizontal%20cubit/horizontal_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomHorizontalBooksViewList extends StatelessWidget {
  const CustomHorizontalBooksViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalBooksCubit, HorizontalBooksState>(
      builder: (context, state) {
        if (state is HorizontalBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => CustomImageItem(
                    aspectRatio: 2 / 3,
                    imagePath:
                        state
                            .bookModel[index]
                            .volumeInfo!
                            .imageLinks!
                            .thumbnail ??
                        'https://demofree.sirv.com/nope-not-here.jpg',
                    heightRatio: 0.18,
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.bookModel[index],
                      );
                    },
                  ),
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemCount: state.bookModel.length,
            ),
          );
        } else if (state is HorizontalBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }
}
