import 'package:bookly_app/Features/Home/presentation/manager/similar%20book%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CustomHorizontalDetailsViewList extends StatelessWidget {
  const CustomHorizontalDetailsViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
          builder: (context, state) {
            if (state is SimilarBooksSuccess) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CustomImageItem(
                  aspectRatio: 2 / 3,
                  heightRatio: 0.18,
                  imagePath:
                      state
                          .bookModel[index]
                          .volumeInfo!
                          .imageLinks!
                          .thumbnail ??
                      'https://demofree.sirv.com/nope-not-here.jpg',
                  onTap: () {
                    Get.to(() => BookDetailsView(book: state.bookModel[index]));
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
              );
            } else if (state is SimilarBooksFailure) {
              return Text(state.errorMessage);
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}
