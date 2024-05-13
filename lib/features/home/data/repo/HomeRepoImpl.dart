import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled1/core/Errors/faliuer.dart';
import 'package:untitled1/features/home/data/model/homeModel.dart';
import 'package:untitled1/features/home/data/repo/HomeRepo.dart';
import 'package:untitled1/features/login/data/model/LoginModel.dart';
import 'package:untitled1/features/login/data/repo/LoginRepo.dart';

import '../../../../core/services/apiServices.dart';

class HomeRepoIMPL implements HomeRepo {

  ApiServices apiServices= ApiServices();
  @override
  Future<Either<Failure, HomeModel>> GetHomeData()async {

    try {
      var  responce =await apiServices.get(endPoints: 'home');






      return Right(HomeModel.fromJson(responce.data));

    }  catch (e) {
      if (e is DioError){
        return Left(servasicesFailure.FromDio(e));
      }
      return left(servasicesFailure(errorMassge: e.toString()));
    }
  }


}




