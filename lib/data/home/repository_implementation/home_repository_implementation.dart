import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/data/home/datasource/home_datasource.dart';
import 'package:task/data/home/model/data_model.dart';
import 'package:task/domain/home/repository/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImplementation extends HomeRepository {
  HomeRepositoryImplementation(this.homeDataSource);

  final HomeDataSource homeDataSource;

  @override
  Future<Either<Failure, List<DataModel>>> getHomeData() async {
    try {
      final result = await homeDataSource.getHomeData();
      return Right<Failure, List<DataModel>>(result);
    } on NotFoundException {
      return Left<Failure, List<DataModel>>(NotFoundFailure());
    } on ServerUnavailableException {
      return Left<Failure, List<DataModel>>(ServerUnavailableFailure());
    } on InternalServerException {
      return Left<Failure, List<DataModel>>(InternalServerFailure());
    } on BadRequestException {
      return Left<Failure, List<DataModel>>(BadRequestFailure());
    } on NoInternetConnectionException {
      return Left<Failure, List<DataModel>>(NoInternetConnectionFailure());
    } on ParseJsonException {
      return Left<Failure, List<DataModel>>(ParseJsonFailure());
    }
  }
}
