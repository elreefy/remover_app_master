part of 'remover_cubit.dart';

@immutable
abstract class RemoverState {}

class RemoverInitial extends RemoverState {}
//create ImagePickerSuccess state
class ImagePickerSuccess extends RemoverState {}
//create ImagePickerError state
class ImagePickerError extends RemoverState {
  final String error;
  ImagePickerError(this.error);
}
//create postImageToServervLoadingState state
class postImageToServervLoadingState extends RemoverState {}
//create postImageToServerSuccessState state
class postImageToServerSuccessState extends RemoverState {}
//create postImageToServerErrorState state
class postImageToServerErrorState extends RemoverState {
  final String error;
  postImageToServerErrorState(this.error);
}
//changeCoverLoadingState
class changeCoverLoadingState extends RemoverState {}
//changeCoverSuccessState
class changeCoverSuccessState extends RemoverState {}
//changeCoverErrorState
class changeCoverErrorState extends RemoverState {
  final String error;
  changeCoverErrorState(this.error);
}