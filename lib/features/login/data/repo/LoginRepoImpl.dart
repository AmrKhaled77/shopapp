import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/core/Errors/faliuer.dart';
import 'package:untitled1/features/login/data/repo/LoginRepo.dart';

import '../../../../core/services/apiServices.dart';
import '../../../home/presentation/view/HomePage.dart';
import '../model/LoginModel.dart';

class LoginRepoImpl implements LoginRepo{

  ApiServices apiServices= ApiServices();

  @override
  Future<Either<Failure,UserModel>> Login({required String email, required String password})async {
    try {
      var  responce =await apiServices.post(endPoints: 'login',auth: false, data: {

        'email':email,
        'password': password,
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