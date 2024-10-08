import 'package:bloc_imagepicker/bloc/image_picker_bloc.dart';
import 'package:bloc_imagepicker/screens/image_picker.dart';
import 'package:bloc_imagepicker/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePickerUtils = ImagePickerUtils();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ImagePickerBloc(imagePickerUtils),
        child: const ImagePicker(),
      ),
    );
  }
}


