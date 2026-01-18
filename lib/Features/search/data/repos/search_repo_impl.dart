import 'package:bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_serevice.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class SearchRepoImpl extends SearchRepo {
  ApiService apiService;
  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBook(String query)async {
   return await getDataHandling(
      endPoint: 'q=$query&filtering=free-ebooks',
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