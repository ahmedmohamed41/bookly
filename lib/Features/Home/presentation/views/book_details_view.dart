import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/manager/similar%20book%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).fetchSimilarBookHome(widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailsViewBody(book: widget.book));
  }
}
