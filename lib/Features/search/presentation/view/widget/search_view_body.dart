import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_vertical_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search%20book%20cubit/search_books_cubit.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              hintText: 'Search',
              suffixIcon: IconButton(
                onPressed: () {
                  if (searchController.text.isEmpty) return;
                  BlocProvider.of<SearchBooksCubit>(
                    context,
                  ).searchBook(searchController.text);
                },
                icon: const Icon(Icons.search_outlined),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Search Result', style: Styles.textStyleSearch),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<SearchBooksCubit, SearchBooksState>(
              listener: (context, state) {
                if (state is SearchBooksFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is SearchBooksLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SearchBooksSuccess) {
                  if (state.books.isEmpty) {
                    return const Center(child: Text('No books found'));
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CustomVerticalItem(
                      bookModel: state.books[index],
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index],
                        );
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: state.books.length,
                  );
                }
                return const Center(child: Text('Start searching for books'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
