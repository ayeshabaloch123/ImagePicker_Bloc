import 'dart:io';
import 'package:bloc_imagepicker/bloc/image_picker_bloc.dart';
import 'package:bloc_imagepicker/bloc/image_picker_event.dart';
import 'package:bloc_imagepicker/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: const Text('Image Picker Bloc'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(CameraCapture());
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.camera),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(GalleryPicker());
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.photo_library),
                      ))
                ],
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}
