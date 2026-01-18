import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'horizontal_books_state.dart';

class HorizontalBooksCubit extends Cubit<HorizontalBooksState> {
  HorizontalBooksCubit(this.homeRepo) : super(HorizontalBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchHorizontalBooks() async {
    emit(HorizontalBooksLoading());
    var result = await homeRepo.fetchHorizontalBooksViewListHome();
    result.fold(
      (failure) {
        emit(HorizontalBooksFailure(failure.errMessage));
      },
      (books) {
        emit(HorizontalBooksSuccess(books));
      },
    );
  }
}
