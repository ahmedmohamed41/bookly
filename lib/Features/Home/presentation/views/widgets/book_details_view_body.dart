import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_appbar_details.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_image_item.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_item_details_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_vertical_details_view_list.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const CustomAppbarDetails(),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: CustomImageItem(
              aspectRatio: 1 / 2,
              heightRatio: 0.18,
              imagePath:
                  book.volumeInfo!.imageLinks!.thumbnail ??
                  'https://demofree.sirv.com/nope-not-here.jpg',
            ),
          ),
          const SizedBox(height: 20),
          Text(book.volumeInfo!.title ?? '', style: Styles.textStyle30),
          Text(
            book.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
              color: Colors.white.withAlpha(150),
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star, size: 20, color: Colors.yellow),
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomItemDetailsView(
                colorContainar: Colors.white,
                colorText: Colors.black,
                titleText: 'free €',
                topLeft: Radius.circular(13),
                bottomLeft: Radius.circular(13),
              ),
              GestureDetector(
                onTap: () {
                  launchUrl(
                    Uri.parse(book.volumeInfo!.previewLink!),
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const CustomItemDetailsView(
                  colorContainar: Colors.red,
                  colorText: Colors.white,
                  titleText: 'Free preview',
                  bottomRight: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text('You can also like'),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const CustomHorizontalDetailsViewList(),
        ],
      ),
    );
  }
}
