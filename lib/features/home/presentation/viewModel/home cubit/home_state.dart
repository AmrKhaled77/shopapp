part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class ChangeIndexState extends HomeState {}


final class HomeGetDataLoadingState extends HomeState {}

final class HomeGetDataSucsessState extends HomeState {
  final HomeModel homeModel;
  HomeGetDataSucsessState(this.homeModel);


}

final class HomeGetDataErrorState extends HomeState {

  String error;
  HomeGetDataErrorState(this.error);
}
