import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/features/home/data/model/homeModel.dart';
import 'package:untitled1/features/home/presentation/view/widgets/ProdectDetailsBody.dart';

class ProdectItemDeatilsScreen extends StatelessWidget {
   ProdectItemDeatilsScreen({super.key, required this.index});
final int index;
 // final String Image;
 //
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ProdectDeatilsBody(index: index,),
    );
  }
}
