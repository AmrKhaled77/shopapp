import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/core/services/apiServices.dart';
import 'package:untitled1/features/login/data/model/LoginModel.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  
  
  ApiServices apiServices=ApiServices();
  
  

  getUser()async{
    emit(SettingsLoading());
      await apiServices.get(endPoints: 'profile',auth: true).then((value) => {
    
        print('sss'),
        print(value.data),
      emit(SettingsSucsses(
        UserModel.fromjson(value.data)
      ))
      }).catchError((e){

        emit(SettingsErorr(e.toString()));
      });
      

    
  }


  updateUser({required String name,required String email,required String phone})async{
    emit(UpdateLoading());
      await apiServices.put(auth: true,
        endPoints: 'update-profile',
        data: {
          'name':name,
          'phone':phone,
          'email':email,
        }


      ).then((value) => {

        print('sss'),
        print(value.data),
      emit(UpdateSucsses(
        UserModel.fromjson(value.data)
      ))
      }).catchError((e){

        emit(UpdateErorr(e.toString()));
      });



  }
}
