import 'package:dartz/dartz.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/data/home/model/data_model.dart';

abstract class HomeRepository {
  Future<Either<Failure,List<DataModel>>> getHomeData();
}
