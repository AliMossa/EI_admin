import 'dart:io';

import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EmployeesMiddleware {
  File? image;
  String? kind;
  String? time;
  FocusNode? _fatherNameFocusNode;
  FocusNode? _lastNameFocusNode;
  FocusNode? _motherNameFocusNode;
  FocusNode? _emailFocusNode;
  FocusNode? _phoneFocusNode;
  FocusNode? _linkedInFocusNode;
  FocusNode getfatherNameFocusNode() =>
      _fatherNameFocusNode ?? (_fatherNameFocusNode = FocusNode());
  FocusNode getmotherNameFocusNode() =>
      _motherNameFocusNode ?? (_motherNameFocusNode = FocusNode());
  FocusNode getlastNameFocusNode() =>
      _lastNameFocusNode ?? (_lastNameFocusNode = FocusNode());
  FocusNode getEmailFocusNode() =>
      _emailFocusNode ?? (_emailFocusNode = FocusNode());
  FocusNode getPhoneFocusNode() =>
      _phoneFocusNode ?? (_phoneFocusNode = FocusNode());
  FocusNode getLinkedInFocusNode() =>
      _linkedInFocusNode ?? (_linkedInFocusNode = FocusNode());
  void loadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  void setDate(BuildContext context) async {
    print('state');
    final result = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (result != null) {
      time = DateFormat('dd-MM-yyyy').format(result);
      context.read<DateCubit>().setDate();
      print(time);
    }
  }
}
