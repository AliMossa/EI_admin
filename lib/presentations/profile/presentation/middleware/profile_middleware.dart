import 'dart:io';

import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/update_enitity.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/profile_shimmer.dart';
import 'package:admin_dashboard/presentations/public/shimmers/search_shimmer.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileMiddleware {
  ProfileMiddleware? _profileMiddleware;
  ProfileMiddleware get() =>
      _profileMiddleware ?? (_profileMiddleware = ProfileMiddleware());
  String _email = '';
  String _phone = '';
  ProfileEntity _profielEntity = ProfileEntity.init();
  TotalProfileLogsEntity _logs = TotalProfileLogsEntity.init();
  File? _image;
  MultipartFile? _sendImage;

  void setEmail(String value) => _email = value;
  void setPhone(String value) => _phone = value;
  void loadImage(ProfileBloc bloc) async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      _sendImage = await MultipartFile.fromFile(
        pickedImage.path,
        filename: pickedImage.name,
      );
    }
    bloc.add(UpdateProfileInfoEvent());
  }

  File? getPersonalImage() => _image;

  void setProfileEntity(ProfileEntity newProfielEntity) {
    _profielEntity.id = newProfielEntity.id;
    _profielEntity.roleId = newProfielEntity.roleId;
    _profielEntity.name = newProfielEntity.name;
    _profielEntity.email = newProfielEntity.email;
    _profielEntity.phone = newProfielEntity.phone;
    _profielEntity.joindedDate = newProfielEntity.joindedDate;
    _profielEntity.pesonalPhoto =
        newProfielEntity.pesonalPhoto.isNotEmpty
            ? NetworkApisRouts().getBaseUrl() + newProfielEntity.pesonalPhoto
            : "";
  }

  void setLogs(TotalProfileLogsEntity totalProfileLogsEntity) {
    _logs.list = totalProfileLogsEntity.list;
    _logs.nextPage = totalProfileLogsEntity.nextPage;
  }

  void updateLogs(TotalProfileLogsEntity totalProfileLogsEntity) {
    _logs.list.addAll(totalProfileLogsEntity.list);
    _logs.nextPage = totalProfileLogsEntity.nextPage;
  }

  TotalProfileLogsEntity getTotalProfileLogsEntity() => _logs;
  ProfileEntity getProfileEntity() => _profielEntity;

  UpdateEnitity updateProfile() {
    if (_email.isNotEmpty) {
      _profielEntity.email = _email;
    }
    if (_phone.isNotEmpty) {
      _profielEntity.phone = _phone;
    }
    return UpdateEnitity(email: _email, phone: _phone, image: _sendImage);
  }

  void showGetProfileFailedMessage(BuildContext context, ProfileState state) {
    if (state is FailedGetProfileInfoState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedUpdateProfileInfoState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  Either<Widget, Widget> checkCurrentState(ProfileState state, Size size) {
    if (state is LoadingGetProfileInfoState) {
      return right(ProfileShimmer(size: size));
    } else if (state is SuccessGetProfileInfoState &&
        _profielEntity.name.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedGetProfileInfoState) {
      return right(SvgPicture.asset(Assets.images.error));
    } else {
      return left(SizedBox());
    }
  }
}
