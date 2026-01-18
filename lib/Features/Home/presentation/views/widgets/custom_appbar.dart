import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
          icon: const Icon(Icons.search_outlined, size: 30),
        ),
      ],
    );
  }
}
