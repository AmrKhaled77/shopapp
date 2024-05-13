import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/services/cacheHelper.dart';
import 'package:untitled1/core/utills/Constants.dart';
import 'package:untitled1/features/home/data/repo/HomeRepoImpl.dart';
import 'package:untitled1/features/home/presentation/viewModel/home%20cubit/home_cubit.dart';
import 'package:untitled1/features/login/presentation/view/LoginScreen.dart';

import 'features/categoris/data/repo/CategoriRepoIMPL.dart';
import 'features/categoris/presentation/viewModel/catrgori Cubit/catigori_cubit.dart';
import 'features/home/presentation/view/HomePage.dart';
import 'features/home/presentation/viewModel/bottom navigation bar cubit/bottom_navigation_bar_cubit.dart';
import 'features/settings/presentation/ViewModel/SettingsBloc/settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await cacheHelper.init();

 try{
   Token= await cacheHelper.getdata(key: 'token');
 }catch(e){

 }
 print('token ${Token}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(
        create: (BuildContext context) => HomeCubit(HomeRepoIMPL())..getHomeData(),

      ), BlocProvider<CatigoriCubit>(
        create: (context) => CatigoriCubit(CategoriRepoIMPL())..getCategoriData(),
      ),
    BlocProvider<SettingsCubit>(
    create: (BuildContext context) { return   SettingsCubit()..getUser();
    }
    ),


    ],


      child:  MaterialApp(

        debugShowCheckedModeBanner: false,


        title: 'Flutter Demo',


        home:  GetMainScreen()
      )
    );

  }
}

Widget GetMainScreen(){
  if(Token==''){
    return LoginScreen();
  }else return HomePage();
}





