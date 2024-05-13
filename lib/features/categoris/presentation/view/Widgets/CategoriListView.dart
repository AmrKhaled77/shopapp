import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/widgets/toast.dart';
import 'package:untitled1/features/categoris/data/model/CategoriModel.dart';
import 'package:untitled1/features/categoris/presentation/view/Widgets/CategoriItem.dart';
import 'package:untitled1/features/categoris/presentation/viewModel/catrgori%20Cubit/catigori_cubit.dart';

class CategoriListView extends StatelessWidget {
  const CategoriListView({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<CatigoriCubit,CatigoriState>(
      builder: (BuildContext context, CatigoriState state) {

        if(state is CatigoriSucsses){
          return ListView.separated(
            itemCount:state.categoriModel.elments.data.length ,


              itemBuilder: (context,index){

                return CategoriItem(categoriModel:state.categoriModel ,index: index,);
              }, separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 20,
                color: Colors.grey,
              );
          },);

        }else if(state is CatigoriError){
          return Text(state.error);
          showtoast(text: state.error, color: Colors.red);

        }else {return
        Center(child: CircularProgressIndicator(),);
        }
      },

    );
  }
}
