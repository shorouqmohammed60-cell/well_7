import 'package:new_strucuture/core/exports.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hint;

  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final bool enabled;
  final bool isMessage;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final  TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
   CustomTextField({
    super.key,
    this.hint,
    this.labelText,
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isMessage = false,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.isPassword = false,
    this.onSubmitted,
    this.borderRadius,
    this.enabled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode myFocusNode = FocusNode();
  bool showPassword = false;
  @override
  void initState() {
    super.initState();

    myFocusNode.addListener(() {
      setState(() {
        // color = Colors.black;
      });
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isMessage ? 150.h : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: TextFormField(
            enabled: widget.enabled,
            controller: widget.controller,
            expands: false,
            onTap: widget.onTap,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            focusNode: widget.focusNode ?? widget.focusNode,
            style: getHintStyle(),
            onChanged: widget.onChanged,
            validator: widget.validator,
            
            keyboardType: widget.keyboardType,
            maxLines: widget.isMessage ? 5 : 1,
            minLines: widget.isMessage ? 5 : 1,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onSubmitted,
            initialValue: widget.initialValue,
            obscureText: widget.isPassword ? !showPassword : false,
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  widget.enabled ? AppColors.textFieldColorFilled : AppColors.darkGrey,
              labelText: widget.labelText,
              // hint: widget.hint != null ? Text(widget.hint!) : null,
              hintText: widget.hint,
              
              labelStyle: getRegularStyle(
                fontHeight: 1,
                color: myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
              ),
              prefixIcon: widget.prefixIcon,
              prefixIconColor:
                  myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
              suffixIconColor:
                  myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    )
                  : widget.suffixIcon,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              hintStyle: getHintStyle(
                color: AppColors.gray,
                fontSize: 14,
                fontStyle: FontStyle.normal,

              ),
              errorStyle: getRegularStyle(color: AppColors.red, fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkGrey, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 13.r)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkGrey, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 13.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 13.r)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 13.r)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 13.r)),
              ),
            ),
          ),
        ),
      );
      
    
  }
}
