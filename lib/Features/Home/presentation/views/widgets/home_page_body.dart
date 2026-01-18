import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_books_view_list.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_vertical_list_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          CustomAppbarHome(),
          SizedBox(height: 20),
          CustomHorizontalBooksViewList(),
          SizedBox(height: 30),
          Text('Best Seller', style: Styles.textStyle18),
          SizedBox(height: 20),
          CustomBestSellerListItem(),
        ],
      ),
    );
  }
}
