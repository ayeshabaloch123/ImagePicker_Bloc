import 'package:bloc/bloc.dart';
import 'package:bloc_imagepicker/bloc/image_picker_event.dart';
import 'package:bloc_imagepicker/bloc/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState>{
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils): super(const ImagePickerState()){
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);

  }

  void _cameraCapture(CameraCapture event , Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(GalleryPicker event , Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.galleryPicker();
    emit(state.copyWith(file: file));
  }
}