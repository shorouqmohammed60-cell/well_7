import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_strucuture/config/routes/app_routes.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:new_strucuture/core/widgets/custom_button2.dart';
import 'package:new_strucuture/core/widgets/custom_row.dart';
import 'package:new_strucuture/core/widgets/custom_text_form_field.dart';
import 'package:new_strucuture/features/main_screen/screens/main_screen.dart';
import 'package:new_strucuture/features/register/cubit/cubit/register_cubit.dart';

class Register extends StatefulWidget {
  const Register({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<Register> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<Register> {
  final _key = GlobalKey<FormState>();
  final TextEditingController facilityNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController vatNunberController = TextEditingController();

  final FocusNode facilityNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode vatNumberFocusNode = FocusNode();

  @override
  void dispose() {
    facilityNameController.dispose();
    emailController.dispose();
    vatNunberController.dispose();

    facilityNameFocusNode.dispose();
    emailFocusNode.dispose();
    vatNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
              top: false,
              child: Scaffold(
                  backgroundColor: AppColors.white,
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: CustomAppBar(
                      title: 'Register'.tr(),
                      showBackButton: true,
                    ),
                  ),
                  body: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalPadding(context),
                          ),
                          child: Form(
                              key: _key,
                              child: Column(
                                children: [
                                  boxSizeHeight(context),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        clipBehavior: Clip.none,
                                        children: [
                                          CircleAvatar(
                                            radius: 70.r,
                                            backgroundColor:
                                                AppColors.textFieldColorFilled,
                                            backgroundImage: context
                                                        .read<RegisterCubit>()
                                                        .selectedImage !=
                                                    null
                                                ? FileImage(
                                                    context
                                                        .read<RegisterCubit>()
                                                        .selectedImage!,
                                                  )
                                                : const AssetImage(
                                                    ImageAssets.registerImage),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<RegisterCubit>()
                                                  .pickImage();
                                            },
                                            child: CircleAvatar(
                                              radius: 24.r,
                                              backgroundColor:
                                                  AppColors.primary,
                                              child: SvgPicture.asset(
                                                  ImageAssets.registerIcon),
                                            ),
                                          ),
                                          if (context
                                                  .read<RegisterCubit>()
                                                  .selectedImage !=
                                              null)
                                            PositionedDirectional(
                                              top: -10,
                                              start: -10,
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<RegisterCubit>()
                                                      .deletImage();
                                                },
                                                child: CircleAvatar(
                                                  radius: 17.r,
                                                  backgroundColor:
                                                      AppColors.red,
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 18.sp,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ]),
                                  ),
                                  boxSizeHeight(context),
                                  CustomRow(
                                    iconPath: ImageAssets.facilityName,
                                    text: 'Facility_Name'.tr(),
                                    isRequired: true,
                                  ),
                                  boxSizeHeight(context),
                                  TextFormField(
                                    controller: facilityNameController,
                                    focusNode: facilityNameFocusNode,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(emailFocusNode);
                                    },
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please_enter_your_facility_name'
                                            .tr();
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.textFieldColorFilled,
                                      isDense: false,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 13.h),
                                      hintText: 'Facility_Name'.tr(),
                                      hintStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp,
                                          color: AppColors.gray),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.darkGrey,
                                            width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13.r)),
                                      ),
                                      errorStyle: getRegularStyle(
                                          color: AppColors.red,
                                          fontSize: 12.sp),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.primary, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13.r)),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.red, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13.r)),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.red, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13.r)),
                                      ),
                                    ),
                                  ),
                                  boxSizeHeight(context),
                                  CustomRow(
                                    iconPath: ImageAssets.email,
                                    text: 'Email'.tr(),
                                    isRequired: true,
                                  ),
                                  boxSizeHeight(context),
                                  CustomTextField(
                                    controller: emailController,
                                    focusNode: emailFocusNode,
                                    hint: 'mail@mail.com',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please_enter_your_email'.tr();
                                      }
                                      String pattern = r'^[^@]+@[^@]+\.[^@]+$';
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'Enter_a_valid_email_address'
                                            .tr();
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(vatNumberFocusNode);
                                    },
                                  ),
                                  boxSizeHeight(context),
                                  CustomRow(
                                    iconPath: ImageAssets.vatNumber,
                                    text: 'VAT_Number'.tr(),
                                    isRequired: false,
                                  ),
                                  boxSizeHeight(context),
                                  CustomTextField(
                                    controller: vatNunberController,
                                    hint: 'VAT_Number'.tr(),
                                    //validator: (value) {
                                    // if (value == null || value.isEmpty) {
                                    // return 'Please_enter_your_VAT_number'.tr();
                                    //}
                                    // return null;
                                    // },
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                  boxSizeHeight(context, height: 40.h),
                                  CustomButton(
                                    text: 'Let’s_start'.tr(),
                                    textStyle: getHintStyle(
                                        color: AppColors.white,
                                        fontSize: 16.sp),
                                    height: 48,
                                    borderRadius: 28,
                                    onPressed: () {
                                      // context.read<RegisterCubit>().register(facillityName: facilityNameController.text, email: emailController.text, vatNumber: vatNunberController.text);

                                      if (_key.currentState!.validate()) {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.mainRoute,
                                        );
                                      } else {
                                       customShowSnackbar(message: "Try again", context:context);

                                      
                                      }
                                    },
                                  ),
                                ],
                              ))))));
        },
      ),
    );
  }
}
