import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/core/services/apiServices.dart';
import 'package:untitled1/features/categoris/presentation/view/CategorisScreen.dart';
import 'package:untitled1/features/favorite/presentation/view/favoriteScreen.dart';
import 'package:untitled1/features/home/data/model/homeModel.dart';
import 'package:untitled1/features/home/presentation/view/HomePage.dart';
import 'package:untitled1/features/login/data/model/LoginModel.dart';
import 'package:untitled1/features/settings/presentation/view/SettingScreen.dart';

import '../../../../../core/widgets/toast.dart';
import '../../../../favorite/data/models/favoriteModel.dart';
import '../../../data/repo/HomeRepo.dart';
import '../../view/HomeScreen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  
  Map <int ,bool> favorite ={};


  HomeCubit(this.homeRepo) : super(HomeInitial());
  ApiServices apiServices=ApiServices();




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

   HomeModel? HomeData;
   FavoriteModel? favoriteModel;
 getHomeData()async{

   emit(HomeGetDataLoadingState());
   var response =await homeRepo.GetHomeData();





   response.fold((l) => {
     print('status'),
     print(l.errorMassge),
     emit(HomeGetDataErrorState(l.errorMassge))
   }, (r)async => { print('status'),

     print(r.status),
     print(r.data.banners.length),
     HomeData= await r,

     r.data.products.forEach((element) { 
favorite.addAll({
  element.id:element.inFavorites
}) ;
     }),


     emit(HomeGetDataSucsessState(r))
   });
 }

  ChangeFavorite({required int productId})async{
   favorite[productId]=!favorite[productId]!;

    emit(HomeChangeFavoriteLoadingState());

    await apiServices.post(endPoints: 'favorites',auth: true, data: {
      'product_id': productId,

    }).then((value) => {


      print(value.data),
      emit(HomeChangeFavoriteSucsessState(),),

      if(!(value.data['status']))
      {
        favorite[productId]=!favorite[productId]!,
        showtoast(text: value.data['message'], color: Colors.red)
      }else{
        getFavorite()
      }
    
    }).catchError((e){

      emit(HomeChangeFavoriteErrorState(e.toString()));
      favorite[productId]=!favorite[productId]!;
      showtoast(text:'there was an error', color: Colors.red);
    });



  }

  getFavorite()async{
    emit(FavoriteLoading());
    await apiServices.get(endPoints: 'favorites',auth: true).then((value)  => {
       favoriteModel=   FavoriteModel.fromJson(value.data),
      favoriteModel!.elemnt.data.forEach((element) {
        print("favorits :${element.id}");
      }),

      emit(FavoriteSucsess(
          FavoriteModel: FavoriteModel.fromJson(value.data)
      )),
      print('sucsessss'),

    }).catchError((e){

      emit(FavoriteError(error: e.toString()));

      print('errorrrr');
      print( e.toString());

    });



  }
 }





