import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../categoris/presentation/view/CategorisScreen.dart';
import '../../../../favorite/presentation/view/favoriteScreen.dart';
import '../../../../settings/presentation/view/SettingScreen.dart';
import '../../view/HomeScreen.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());




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
}
