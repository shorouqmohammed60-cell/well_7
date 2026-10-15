import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_strucuture/core/exports.dart';
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
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: CustomAppBar(
                  title: 'Register',
                  showBackButton: true,
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getHorizontalPadding(context),
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      boxSizeHeight(context),
                      SvgPicture.asset(ImageAssets.register),
                      boxSizeHeight(context),
                      CustomRow(
                        iconPath: ImageAssets.facilityName,
                        text: 'Facility Name',
                        isRequired: true,
                      ),
                      boxSizeHeight(context),
                      TextFormField(
                        controller: facilityNameController,
                        focusNode: facilityNameFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(emailFocusNode);
                        },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your facility name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textFieldColorFilled,
                          isDense: false,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 16.h),
                          hintText: 'Facility Name',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp,
                              color: AppColors.gray),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.darkGrey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          errorStyle: getRegularStyle(
                              color: AppColors.red, fontSize: 12),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primary, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                        ),
                      ),
                      boxSizeHeight(context),
                      CustomRow(
                        iconPath: ImageAssets.email,
                        text: 'Email',
                        isRequired: true,
                      ),
                      boxSizeHeight(context),
                      CustomTextField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        hint: 'mail@mail.com',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
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
                        text: 'VAT Number',
                        isRequired: false,
                      ),
                      boxSizeHeight(context),
                      CustomTextField(
                        controller: vatNunberController,
                        hint: 'VAT Number',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your VAT number';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      boxSizeHeight(context, height: 40.h),
                      CustomButton(
                        text: 'Let’s start',
                        textStyle: getHintStyle(
                            color: AppColors.white, fontSize: 16.sp),
                        width: 200,
                        height: 48,
                        borderRadius: 28,
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            print(" valid");
                          } else {
                            print("not valid");
                          }
                          context.read<RegisterCubit>().register(facillityName: facilityNameController.text, email: emailController.text, vatNumber: vatNunberController.text);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
