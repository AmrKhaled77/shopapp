import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/features/categoris/presentation/view/CategorisScreen.dart';
import 'package:untitled1/features/favorite/presentation/view/favoriteScreen.dart';
import 'package:untitled1/features/home/data/model/homeModel.dart';
import 'package:untitled1/features/home/presentation/view/HomePage.dart';
import 'package:untitled1/features/settings/presentation/view/SettingScreen.dart';

import '../../../data/repo/HomeRepo.dart';
import '../../view/HomeScreen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {


  HomeCubit(this.homeRepo) : super(HomeInitial());




  final HomeRepo homeRepo;


 int CurrntIndex=0;

List<Widget> Screens=[
  HomeScreen(),
   CategorisScreen(),
   FavoriteSceen(),
   settinscreen(),

];

  ChangeIndex(index){
   CurrntIndex=index;
   emit(ChangeIndexState());
 }

 late  HomeModel HomeData;
 getHomeData()async{

   emit(HomeGetDataLoadingState());
   var response =await homeRepo.GetHomeData();





   response.fold((l) => {
     print('status'),
     print(l.errorMassge),
     emit(HomeGetDataErrorState(l.errorMassge))
   }, (r) => { print('status'),

     print(r.status),
     print(r.data.banners.length),
     HomeData=r,


     emit(HomeGetDataSucsessState(r))
   });
 }

 }





