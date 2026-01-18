import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBestSellerBookHome() async {
    emit(BestSellerLoading());
    var result = await homeRepo.fetchBestSellerBookHome();
    result.fold(
      (failure) {
        emit(BestSellerFailure(failure.errMessage));
      },
      (books) {
        emit(BestSellerSuccess(books));
      },
    );
  }
}
