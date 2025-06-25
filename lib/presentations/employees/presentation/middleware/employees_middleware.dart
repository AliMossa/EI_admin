import 'dart:io';
import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_info_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/employee_enitity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_employees/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/active/active_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_cancle_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_ok_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/show_notice_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/public/view_personal_image/logic/cubit/member_image_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/public/view_personal_image/middleware/member_image_middleware.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

int _teamKind = 0;
int _teamState = 1;

class EmployeesMiddleware extends MemberImageMiddleware {
  EmployeesMiddleware? _employeesMiddleware;
  EmployeesMiddleware get() =>
      _employeesMiddleware ?? (_employeesMiddleware = EmployeesMiddleware());
  int _birthCity = 0;
  int _currnetCity = 0;
  bool _isActive = false;
  File? _frontIdImage;
  File? _backIdImage;
  MultipartFile? _sendingFrontIdImage;
  MultipartFile? _sendingBackIdImage;
  MultipartFile? _sendingPersonalImage;
  TotalEmployeesEntity _totalEmployeesEntity = TotalEmployeesEntity.init();
  String? _fullName;
  String? _fatherName;
  String? _motherName;
  String? _phoneNumber;
  String? _email;
  String? _address;
  String? _time;
  String _password = '';
  String _confirmPassword = '';
  FocusNode? _fatherNameFocusNode;
  FocusNode? _lastNameFocusNode;
  FocusNode? _motherNameFocusNode;
  FocusNode? _emailFocusNode;
  FocusNode? _phoneFocusNode;
  FocusNode? _linkedInFocusNode;
  FocusNode? _passwordFocusNode;
  FocusNode? _confirmPasswordFocusNode;
  ViewEmployeeEntity _viewEmployeeEntity = ViewEmployeeEntity.init();
  final GlobalKey<FormState> _addEmoloyeeGlobalKey = GlobalKey<FormState>();
  final GlobalKey<AnimatedListState> _animatedListGlobalKey =
      GlobalKey<AnimatedListState>();
  List<EmployeeEnitity> tempList = [];

  File? getFrontIdImage() => _frontIdImage;
  File? getBackIdImage() => _backIdImage;
  int getTeamKind() => _teamKind;
  int getTeamState() => _teamState;
  int getBirthCity() => _birthCity;
  int getCurrentCity() => _currnetCity;
  bool getIsActive() => _isActive;
  void setFullName(String fullName) => _fullName = fullName;
  void setFatherName(String fatherName) => _fatherName = fatherName;
  void setMotherName(String motherName) => _motherName = motherName;
  void setPassword(String password) => _password = password;
  void setConfirmPassword(String confirmPassword) =>
      _confirmPassword = confirmPassword;
  void setPhoneNumber(String phone) => _phoneNumber = phone;
  void setEmail(String email) => _email = email;
  void setAddress(String address) => _address = address;
  void setViewFullName(String fullName) => _viewEmployeeEntity.name = fullName;
  void setViewFatherName(String fatherName) =>
      _viewEmployeeEntity.fatherName = fatherName;
  void setViewMotherName(String motherName) =>
      _viewEmployeeEntity.motherName = motherName;
  void setViewPhoneNumber(String phone) => _viewEmployeeEntity.phone = phone;
  void setViewEmail(String email) => _viewEmployeeEntity.email = email;
  void setViewAddress(String address) => _viewEmployeeEntity.address = address;
  String getPassword() => _password;
  String getConfirmPassword() => _confirmPassword;
  String getDateBirth() => _time!;
  GlobalKey<FormState> getAddEmployeeGlobalKey() => _addEmoloyeeGlobalKey;
  GlobalKey<AnimatedListState> getAnimatedListGlobalKey() =>
      _animatedListGlobalKey;
  FocusNode getPasswordFocusNode() =>
      _passwordFocusNode ?? (_passwordFocusNode = FocusNode());
  FocusNode getConfirmPasswordFocusNode() =>
      _confirmPasswordFocusNode ?? (_confirmPasswordFocusNode = FocusNode());
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

  void setViewEmployeeEntity(ViewEmployeeEntity newViewEmployeeEntity) async {
    _viewEmployeeEntity.id = newViewEmployeeEntity.id;
    _viewEmployeeEntity.roleId = newViewEmployeeEntity.roleId;
    _viewEmployeeEntity.isAcitve = newViewEmployeeEntity.isAcitve;
    _viewEmployeeEntity.name = newViewEmployeeEntity.name;
    _viewEmployeeEntity.email = newViewEmployeeEntity.email;
    _viewEmployeeEntity.phone = newViewEmployeeEntity.phone;
    _viewEmployeeEntity.fatherName = newViewEmployeeEntity.fatherName;
    _viewEmployeeEntity.motherName = newViewEmployeeEntity.motherName;
    _viewEmployeeEntity.address = newViewEmployeeEntity.address;
    _viewEmployeeEntity.dateOfBirth = newViewEmployeeEntity.dateOfBirth;
    _viewEmployeeEntity.personalPhoto = getCorrectImagePage(
      newViewEmployeeEntity.personalPhoto,
    );
    _viewEmployeeEntity.frontIdImage = getCorrectImagePage(
      newViewEmployeeEntity.frontIdImage,
    );
    _viewEmployeeEntity.backIdImage = getCorrectImagePage(
      newViewEmployeeEntity.backIdImage,
    );

    _isActive = _viewEmployeeEntity.isAcitve == 0 ? false : true;
  }

  void resetImagesValues() {
    _sendingBackIdImage = null;
    _sendingFrontIdImage = null;
    _sendingPersonalImage = null;
    _frontIdImage = null;
    _backIdImage = null;
    image = null;
  }

  String? getCorrectImagePage(String? path) =>
      path != null ? NetworkApisRouts().getBaseUrl() + path : path;

  ViewEmployeeEntity getViewEmployeeEntity() => _viewEmployeeEntity;

  @override
  void loadImage(MemberImageCubit cubit) async {
    final pickedImage = await ImagePicker().pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      _sendingPersonalImage = await MultipartFile.fromFile(
        pickedImage.path,
        filename: pickedImage.name,
      );
    }
    cubit.addImage();
  }

  void updateImage(MemberImageCubit cubit) async {
    final pickedImage = await ImagePicker().pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      _sendingPersonalImage = await MultipartFile.fromFile(
        pickedImage.path,
        filename: pickedImage.name,
      );
    }
    cubit.addImage();
  }

  void setEmployees(List<EmployeeEnitity> list) async {
    _totalEmployeesEntity.employees.clear();
    for (EmployeeEnitity item in list.reversed) {
      await Future.delayed(Duration(milliseconds: 150));
      _totalEmployeesEntity.employees.add(item);
      if (_animatedListGlobalKey.currentState != null) {
        _animatedListGlobalKey.currentState!.insertItem(
          _totalEmployeesEntity.employees.length - 1,
        );
      }
    }
  }

  void reSetEmployees(TotalEmployeesEntity totalEmployeesEntity) async {
    _totalEmployeesEntity.nextPage = totalEmployeesEntity.nextPage;
    for (EmployeeEnitity item in totalEmployeesEntity.employees.reversed) {
      await Future.delayed(Duration(milliseconds: 150));
      _totalEmployeesEntity.employees.add(item);
      if (_animatedListGlobalKey.currentState != null) {
        _animatedListGlobalKey.currentState!.insertItem(
          _totalEmployeesEntity.employees.length - 1,
        );
      }
    }
  }

  TotalEmployeesEntity getTotalEmployeesEntity() => _totalEmployeesEntity;

  void loadFrontIdImage(AddEmployeeBloc bloc) async {
    final pickedImages = await ImagePicker().pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );

    if (pickedImages != null) {
      _frontIdImage = File(pickedImages.path);

      _sendingFrontIdImage = await MultipartFile.fromFile(
        pickedImages.path,
        filename: pickedImages.name,
      );
    }

    bloc.add(UpdateIdImagesEmployeesEvent());
  }

  void updateFrontIdImage(ViewUpdateEmployeeBloc bloc) async {
    final pickedImages = await ImagePicker().pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );

    if (pickedImages != null) {
      _frontIdImage = File(pickedImages.path);
      _sendingFrontIdImage = await MultipartFile.fromFile(
        pickedImages.path,
        filename: pickedImages.name,
      );
    }
    bloc.add(UpdateEmployeeIdImageEvent());
  }

  void loadBackIdImage(AddEmployeeBloc bloc) async {
    final pickedImages = await ImagePicker().pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );

    if (pickedImages != null) {
      _backIdImage = File(pickedImages.path);
      _sendingBackIdImage = await MultipartFile.fromFile(
        pickedImages.path,
        filename: pickedImages.name,
      );
    }

    bloc.add(UpdateIdImagesEmployeesEvent());
  }

  void updateBackIdImage(ViewUpdateEmployeeBloc bloc) async {
    final pickedImages = await ImagePicker().pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );

    if (pickedImages != null) {
      _backIdImage = File(pickedImages.path);
      _sendingBackIdImage = await MultipartFile.fromFile(
        pickedImages.path,
        filename: pickedImages.name,
      );
    }
    bloc.add(UpdateEmployeeIdImageEvent());
  }

  void removeBackIdImage(AddEmployeeBloc bloc) async {
    _backIdImage = null;

    bloc.add(RemoveIdImagesEmployeesEvent());
  }

  void removeFrontIdImage(AddEmployeeBloc bloc) async {
    _frontIdImage = null;

    bloc.add(RemoveIdImagesEmployeesEvent());
  }

  void removeFrontIdImageFromDialog(
    BuildContext context,
    AddEmployeeBloc bloc,
  ) async {
    _frontIdImage = null;
    bloc.add(RemoveIdImagesEmployeesEvent());
    Navigator.of(context).pop();
  }

  void removeBackIdImageFromDialog(
    BuildContext context,
    AddEmployeeBloc bloc,
  ) async {
    _backIdImage = null;
    bloc.add(RemoveIdImagesEmployeesEvent());
    Navigator.of(context).pop();
  }

  void setDate(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(
        DateTime.now().year - 10,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    if (result != null) {
      _time = DateFormat('yyyy/MM/dd').format(result);
      print(_time);
      // ignore: use_build_context_synchronously
      context.read<DateCubit>().setDate();
    }
  }

  void showFrontIdImages(BuildContext context, AddEmployeeBloc bloc) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: FileImage(_frontIdImage!),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed:
                          () => removeFrontIdImageFromDialog(context, bloc),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void showUpdatedFrontIdImages(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: NetworkImage(
                      _viewEmployeeEntity.frontIdImage!,
                    ),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void showUpdatedViewFrontIdImages(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: FileImage(_frontIdImage!),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void showUpdatedViewBackIdImages(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: FileImage(_backIdImage!),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void showBackIdImages(BuildContext context, AddEmployeeBloc bloc) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: FileImage(_backIdImage!),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed:
                          () => removeBackIdImageFromDialog(context, bloc),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void showupdatedBackIdImages(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  PhotoView(
                    imageProvider: NetworkImage(
                      _viewEmployeeEntity.backIdImage!,
                    ),
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void activeDeActiveEmployee(
    BuildContext context,
    bool value,
    ViewUpdateEmployeeBloc bloc,
    ActiveCubit cubit,

    int id,
  ) {
    ShowNoticeWidget.showNotice(
      context,
      value ? Text('Active Employee') : Text('Un Active Employee'),
      BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ViewUpdateEmployeeBloc, ViewUpdateEmployeeState>(
          builder:
              (context, state) =>
                  state is LoadingActiveEmployeesState ||
                          state is LoadingUnActiveEmployeesState
                      ? SizedBox(
                        height: 100,

                        child: Center(
                          child: CircularProgressIndicator(
                            color: textFieldBorder,
                          ),
                        ),
                      )
                      : Text('Are you sure?'),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NoticeOkButtonWidget(
            title: 'OK',
            function: () {
              value
                  ? bloc.add(ActiveEmployeeEvent(id: id))
                  : bloc.add(UnActiveEmployeeEvent(id: id));
              setIsActive(value, cubit);
            },
          ),
          NoticeCancleButtonWidget(),
        ],
      ),
      Icon(Icons.autorenew),
    );
  }

  void changeTeamKind(int kind, KindsCubit cubit) {
    _teamKind = kind;
    cubit.changeKind();
  }

  void changeTeamstate(int state, KindsCubit cubit) {
    _teamState = state;
    cubit.changeKind();
  }

  void changebirthCity(int city, KindsCubit cubit) {
    _birthCity = city;
    cubit.changeKind();
  }

  void changeCurrentCity(int city, KindsCubit cubit) {
    _currnetCity = city;
    cubit.changeKind();
  }

  bool getCorrectSwitchTextStyle() {
    return _isActive;
  }

  void setIsActive(bool value, ActiveCubit cubit) {
    _isActive = value;
    cubit.changeActive();
  }

  AddEmployeeInfoEntity getNewEmployeeInfo() => AddEmployeeInfoEntity(
    name: _fullName!,
    fatherName: _fatherName!,
    motherName: _motherName!,
    password: _password,
    confrimPassword: _confirmPassword,
    dateOfBirth: _time.toString(),
    roleId: _teamKind + 3,
    email: _email ?? '',
    phone: _phoneNumber ?? '',
    address: _address ?? '',
    frontIdImage: _sendingFrontIdImage,
    backIdImage: _sendingBackIdImage,
    personalPhoto: _sendingPersonalImage,
  );
  UpdateEmployeeEntity getUpdatedEmployeeInfo() => UpdateEmployeeEntity(
    name: _fullName ?? _viewEmployeeEntity.name,
    fatherName: _fatherName ?? _viewEmployeeEntity.fatherName,
    motherName: _motherName ?? _viewEmployeeEntity.motherName,
    dateOfBirth:
        _time ??
        DateFormat(
          'yyyy/MM/dd',
        ).format(DateTime.parse(_viewEmployeeEntity.dateOfBirth!)),
    roleId: _teamKind + 3,
    email: _email ?? _viewEmployeeEntity.email,
    phone: _phoneNumber ?? _viewEmployeeEntity.phone,
    address: _address ?? _viewEmployeeEntity.address,
    frontIdImage: _sendingFrontIdImage ?? MultipartFile.fromString(''),
    backIdImage: _sendingBackIdImage ?? MultipartFile.fromString(''),
    personalPhoto: _sendingPersonalImage ?? MultipartFile.fromString(''),
  );

  void addEmployeeFunction(BuildContext context, AddEmployeeBloc bloc) {
    if (_addEmoloyeeGlobalKey.currentState!.validate() &&
        _sendingPersonalImage != null &&
        _sendingFrontIdImage != null &&
        _sendingBackIdImage != null) {
      bloc.add(AddNewEmployeeEvent());
    } else {
      SnackBarWidget().show(
        context,
        'can\'t add employee with this information',
        Colors.red,
      );
    }
  }

  void showGetEmployeesFailedMessage(
    BuildContext context,
    EmployeesState state,
  ) {
    if (state is FailedGetEmployeesState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showAddEmployeesFailedMessage(
    BuildContext context,
    AddEmployeeState state,
    ChangePageBloc bloc,
  ) {
    if (state is FailedAddNewEmployeeState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is SuccessAddNewEmployeeState) {
      bloc.add(MoveToEmployeesPageEvent(title: 'Employees'));
    }
  }

  void showViewEmployeesFailedMessage(
    BuildContext context,
    ViewUpdateEmployeeState state,
  ) {
    if (state is FailedViewEmployeesState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedActiveEmployeesState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedUnActiveEmployeesState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedUpdateEmployeesState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  bool checkTempList(EmployeesState state) =>
      state is SuccessGetEmployeesState && tempList.isEmpty ? true : false;

  String? getEmailVaidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? getNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length <= 2) {
      return 'should be more than 2 characters';
    } else {
      return null;
    }
  }

  String? getNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    final mobileRegex = RegExp(r'^\d{10}$');
    if (!mobileRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  String? getPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please insert password';
    } else if (value.length <= 5) {
      return 'please insert more than 5 characters';
    }
    return null;
  }

  String? getConfirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please insert password';
    } else if (value.length <= 5) {
      return 'please insert more than 5 characters';
    } else if (_password != value) {
      return 'diffirent password';
    }
    return null;
  }

  Either<Widget, Widget> getCorrectWidget(EmployeesState state, Size size) {
    if (state is LoadingGetEmployeesState) {
      return right(ListSearchShimmer(size: size));
    } else if (state is SuccessGetEmployeesState && tempList.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty, fit: BoxFit.contain));
    } else if (state is FailedGetEmployeesState) {
      return right(SvgPicture.asset(Assets.images.error, fit: BoxFit.contain));
    } else {
      return left(const SizedBox());
    }
  }
}
