import 'package:bookly_app/Features/search/presentation/view/search_view.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsData.logo1, scale: 3),
        const Spacer(),
        IconButton(
          onPressed: () {
            // GoRouter.of(context).push(AppRouter.kSearchView);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchView(),
              ),
            );
          },
          icon: const Icon(Icons.search_outlined, size: 30),
        ),
      ],
    );
  }
}
