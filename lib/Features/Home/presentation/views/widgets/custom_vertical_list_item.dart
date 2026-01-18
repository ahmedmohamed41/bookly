import 'package:bookly_app/Features/Home/presentation/manager/best%20seller%20cubit/best_seller_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_vertical_item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBestSellerListItem extends StatelessWidget {
  const CustomBestSellerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<BestSellerCubit, BestSellerState>(
          builder: (context, state) {
            if (state is BestSellerSuccess) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CustomVerticalItem(
                  bookModel: state.bookModel[index],
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.bookModel[index],
                    );
                  },
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: state.bookModel.length,
              );
            } else if (state is BestSellerFailure) {
              return Text(state.errorMessage);
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}
