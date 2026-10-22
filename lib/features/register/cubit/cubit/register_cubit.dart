import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:new_strucuture/core/exports.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (image != null) {
        selectedImage = File(image.path);
        emit(RegisterImagePicked());
      }
    } catch (e) {
      emit(RegisterError(msg: e.toString()));
    }
  }
 

  void deletImage(){
    
     
     selectedImage = null;
  emit(RegisterImageDeleted());
  }


  
 


  Future<void> register({
    required String facillityName,
    required String email,
    required String vatNumber,
  }) async {
    emit(RegisterLoading());

    try {
      // API call

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(msg: e.toString()));
    }
  }
}