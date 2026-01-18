import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomVerticalItem extends StatelessWidget {
  const CustomVerticalItem({super.key, this.onTap, required this.bookModel});
  final void Function()? onTap;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CustomImageItem(
            aspectRatio: 1 / 2,
            imagePath:
                bookModel.volumeInfo!.imageLinks!.thumbnail ??
                'https://demofree.sirv.com/nope-not-here.jpg',
            heightRatio: 0.17,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.volumeInfo?.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  bookModel.volumeInfo!.authors?[0] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'free €',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow,
                          ),
                        ),
                        const Text('4.8', style: Styles.textStyle16),
                        const SizedBox(width: 7),
                        Text(
                          '(2390)',
                          style: Styles.textStyle14.copyWith(
                            color: Colors.white.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
