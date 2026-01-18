import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_serevice.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>>
  fetchHorizontalBooksViewListHome() async {
    return await getDataHandling(
      endPoint: 'q=programming&filtering=free-ebooks',
    );
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBookHome() async {
    return await getDataHandling(
      endPoint: 'q=programming&filtering=free-ebooks&sorting=newest',
    );
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBookHome(
    String category,
  ) async {
    return await getDataHandling(
      endPoint: 'q=$category&filtering=free-ebooks',
    );
  }

  Future<Either<Failure, List<BookModel>>> getDataHandling({
    required String endPoint,
  }) async {
    try {
      var data = await apiService.get(endPoints: endPoint);
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
