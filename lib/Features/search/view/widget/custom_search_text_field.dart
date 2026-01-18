import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_outlined),
        ),
      ),
    );
  }
}
