import 'package:flutter/material.dart';

class CustomAppbarDetails extends StatelessWidget {
  const CustomAppbarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('X', style: TextStyle(fontSize: 20)),
        ),
        const Spacer(),
        MaterialButton(
          onPressed: () {},
          child: const Icon(Icons.shopping_cart_outlined, size: 30),
        ),
      ],
    );
  }
}
