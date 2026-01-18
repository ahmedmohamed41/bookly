part of 'horizontal_books_cubit.dart';

sealed class HorizontalBooksState extends Equatable {
  const HorizontalBooksState();

  @override
  List<Object> get props => [];
}

final class HorizontalBooksInitial extends HorizontalBooksState {}

final class HorizontalBooksLoading extends HorizontalBooksState {}

final class HorizontalBooksSuccess extends HorizontalBooksState {
  final List<BookModel> bookModel;

  const HorizontalBooksSuccess(this.bookModel);
}

final class HorizontalBooksFailure extends HorizontalBooksState {
  final String errorMessage;

  const HorizontalBooksFailure(this.errorMessage);
}
