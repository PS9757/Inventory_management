import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/core/usecase/usecase_with_either.dart';
import 'package:task/domain/home/entity/data_entity.dart';
import 'package:task/domain/home/repository/home_repository.dart';

@LazySingleton()
class GetDataUsecase extends UsecaseWithEither<List<DataEntity>, void> {
  GetDataUsecase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<DataEntity>>> call(void params) {
    return homeRepository.getHomeData();
  }
}
