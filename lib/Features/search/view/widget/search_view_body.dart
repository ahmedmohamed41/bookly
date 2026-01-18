import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_vertical_list_item.dart';
import 'package:bookly_app/Features/search/view/widget/custom_search_text_field.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 10),
          Text('Search Result', style: Styles.textStyleSearch),
          SizedBox(height: 20),
          CustomBestSellerListItem(),
        ],
      ),
    );
  }
}
