import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as Path;
import '../../shared/constants/strings.dart';
part 'remover_state.dart';
class RemoverCubit extends Cubit<RemoverState> {
  RemoverCubit() : super(RemoverInitial());

  static RemoverCubit get(context) => BlocProvider.of(context);
  final ImagePicker _picker = ImagePicker();
  File? image;
  Future getImageFromGallery() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(ImagePickerSuccess());
    } else {
      print('no image');
      emit(ImagePickerError('no image'));
    }
  }
  Uint8List? imageAfterRemover;
  Future<void> postImageToServer() async {
    emit(postImageToServervLoadingState());
    String fileName = image!.path.split("/").last;
    FormData data = FormData.fromMap({
      'source_image_file':
      await MultipartFile.fromFile(image!.path, filename: fileName)
    });
    Dio dio = Dio();
    var response = await dio
        .post("https://api.slazzer.com/v2.0/remove_image_background",
        data: data,
        options: Options(
          headers: {'API_KEY': apiKey},
          responseType: ResponseType.bytes,
        ))
        .then((value) {
      imageAfterRemover = value.data;
      emit(postImageToServerSuccessState());
    }).catchError((error) {
      print('the error is $error');
      emit(postImageToServerErrorState(error.toString()));
    });
  }

  //  var imageAfterChangeCover;
  // Future changeCover() async {
  //   emit(changeCoverLoadingState());
  //   var dio = Dio();
  //   var formData = FormData.fromMap({
  //     "bg_image_file": await MultipartFile.fromBytes(imageAfterRemover!),
  //   });
  //   imageAfterChangeCover = await dio.post(
  //       'https://api.slazzer.com/v2.0/remove_image_background',
  //       data: formData,
  //       options: Options(
  //         headers: {'API_KEY': apiKey},
  //         responseType: ResponseType.bytes,
  //       )).then((value) {
  //     emit(changeCoverSuccessState());
  //   }).catchError((error) {
  //     print('the error is $error');
  //     emit(changeCoverErrorState(error.toString()));
  //   });
  //  // print(imageAfterRemover.data);
  // }
}
