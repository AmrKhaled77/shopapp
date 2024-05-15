import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled1/core/Errors/faliuer.dart';
import 'package:untitled1/features/Register/data/repo/register%20repo.dart';
import 'package:untitled1/features/login/data/model/LoginModel.dart';
import '../../../../core/services/apiServices.dart';

class RegesterRepoImpl implements RegisterRepo{
  ApiServices apiServices= ApiServices();
  @override
  Future<Either<Failure, UserModel>> Register({required String email,
    required String password,
    required String name,
    required String phone})async {


    try {
      var  responce =await apiServices.post(endPoints: 'register',auth: false, data: {

        'email':email,
        'password': password,
        'name': name,
        'phone': phone,

      });






      return Right(UserModel.fromjson(responce.data));

    }  catch (e) {
      if (e is DioError){
        return Left(servasicesFailure.FromDio(e));
      }
      return left(servasicesFailure(errorMassge: e.toString()));
    }
  }


}



