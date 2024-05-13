import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/services/cacheHelper.dart';
import 'package:untitled1/features/home/data/repo/HomeRepoImpl.dart';
import 'package:untitled1/features/login/data/repo/LoginRepoImpl.dart';
import 'package:untitled1/features/login/presentation/view/LoginScreen.dart';
import 'package:untitled1/features/login/presentation/viewModel/loginCubit/login_cubit.dart';

import '../../../../core/utills/Constants.dart';
import '../../../../core/widgets/TextFormFeild.dart';
import '../../../../core/widgets/customElevetedButton.dart';
import '../../../../core/widgets/toast.dart';
import '../ViewModel/SettingsBloc/settings_cubit.dart';

class settinscreen extends StatelessWidget {
  const settinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var key =GlobalKey<FormState>();

    final TextEditingController emailController=TextEditingController();
    final TextEditingController nameController=TextEditingController();
    final TextEditingController phoneController=TextEditingController();




    return
     BlocConsumer<SettingsCubit,SettingsState>(
        listener: ( context,  state) {
          if(state is SettingsSucsses){

          if(state.userModel.status!){
            email=state.userModel.data!.email!;
            name=state.userModel.data!.name!;
            phone=state.userModel.data!.phone!;
            print('name${state.userModel.data!.email!}');
          }

          }
          if(state is UpdateSucsses){


            if(state.userModel.status!){
              email=state.userModel.data!.email!;
              name=state.userModel.data!.name!;
              phone=state.userModel.data!.phone!;
              showtoast(text: state.userModel.message!, color: Colors.green);
              print('name${state.userModel.data!.email!}');
            }else{
              showtoast(text: state.userModel.message!, color: Colors.red);
            }
          }



        },
        builder: ( context,  state) {
          emailController.text=email;
          nameController.text=name;
          phoneController.text=phone;


           if(state is SettingsSucsses|| state is UpdateSucsses){
             return Form(
               key: key,
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: CustomTextFormField(controller: emailController, label: 'email',
                       prefixIcon:Icon(Icons.email),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: CustomTextFormField(controller: nameController, label: 'name',prefixIcon:Icon(Icons.person),),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: CustomTextFormField(controller: phoneController, label: 'phone',prefixIcon:Icon(Icons.phone),),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: CustomEevetedButton(text: 'update', onPress: (){
                       if(key.currentState!.validate()){
                         BlocProvider.of<SettingsCubit>(context).updateUser(name: nameController.text, email: emailController.text, phone: phoneController.text);

                       }


                     },),),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: CustomEevetedButton(text: 'LogOut', onPress: (){
                       cacheHelper.clearData(key: 'token');

                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => LoginScreen()),
                       );
                     },),
                   ),


                 ],


               ),
             );
           }else{return Center(child: CircularProgressIndicator());}
        }
      );



  }
}
