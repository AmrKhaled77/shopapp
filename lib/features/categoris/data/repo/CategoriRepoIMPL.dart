import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled1/core/Errors/faliuer.dart';
import 'package:untitled1/core/services/apiServices.dart';
import 'package:untitled1/features/categoris/data/model/CategoriModel.dart';
import 'package:untitled1/features/categoris/data/repo/categoriRepo.dart';

class CategoriRepoIMPL implements CategoriRepo{

  ApiServices apiServices= ApiServices();
  @override
  Future<Either<Failure, CategoriModel>> GetCategoriData()async {

    try {
      var  responce =await apiServices.get(endPoints: 'categories',auth: false);

      print(responce.data.toString());






      return Right(CategoriModel.fromJson(responce.data));

    }  catch (e) {
      if (e is DioError){
        return Left(servasicesFailure.FromDio(e));
      }
      return left(servasicesFailure(errorMassge: e.toString()));
    }
  }
  }




