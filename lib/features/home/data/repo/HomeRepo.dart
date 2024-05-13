
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/features/home/data/model/homeModel.dart';

import '../../../../core/Errors/faliuer.dart';


abstract class HomeRepo {

  Future<Either<Failure, HomeModel>> GetHomeData();
}