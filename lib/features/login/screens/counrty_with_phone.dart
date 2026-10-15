import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/features/login/cubit/cubit.dart';
import 'package:new_strucuture/features/login/cubit/state.dart';
import 'package:new_strucuture/features/login/data/model/country_model.dart';

class CustomCountryPhoneWidget extends StatefulWidget {
  const CustomCountryPhoneWidget({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<CustomCountryPhoneWidget> createState() =>
      _CustomCountryPhoneWidgetState();
}

class _CustomCountryPhoneWidgetState extends State<CustomCountryPhoneWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(
              14.r,
            ),
            border: Border.all(
              color: AppColors.darkGrey,
            ),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<CountryModel>(
                  isExpanded: true,
                  value: cubit.selectedCountry,
                  onChanged: (value) {
                    if (value == null) return;
                    cubit.changeContury(value);

                    // Optional:
                    // Clear phone when country changes
                    widget.controller?.clear();
                  },
                  items: cubit.countries.map(
                    (country) {
                      return DropdownMenuItem<CountryModel>(
                        value: country,
                        child: Row(
                          children: [
                            // Flag
                            Text(
                              country.flag,
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),

                            SizedBox(
                              width: 8.w,
                            ),

                            // Country Name
                            Text(
                              country.name,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Divider(
                color: AppColors.darkGrey,
                height: 1.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    cubit.selectedCountry?.code??"",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    width: 1.w,
                    height: 20.h,
                    color: AppColors.darkGrey,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: widget.controller,

                      keyboardType: TextInputType.phone,

                      // Saudi = 10
                      // Egypt = 11
                      maxLength: cubit.phoneLength(),
                      onSaved: (value) {
                        print("TEXT onSaved $value");
                      },
                      onChanged: (value) {
                        // cubit.changePhone(value);
                         cubit.phone = value;
                         cubit.phoneCode = value;

                         
                      },
                      onFieldSubmitted: (value) {
                        print("TEXT onSubmitted $value");
                      },

                      validator: (value) {
                        // Empty
                        if (value == null || value.isEmpty) {
                          return "Please enter your phone number";
                        }

                        // Wrong length
                        if (value.length != cubit.phoneLength()) {
                          return "Phone number must be ${cubit.phoneLength()} digits";
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.darkGrey,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        counterText: '',
                      ),
                    ),
                  ),
                ],
              ),
              // Text(" cubit.userName ${ cubit.userName}")
            ],
          ),
        );
      },
    );
  }
}
