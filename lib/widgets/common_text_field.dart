import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fave_app/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.labelText,
    this.visibleLabel = true,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.autovalidateMode,
    this.inputFormatters,
    this.icon = const SizedBox(),
  });
  final String labelText;
  final bool visibleLabel;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (visibleLabel)
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            obscureText: obscureText,
            textInputAction: textInputAction,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            cursorColor: AppColor.white,
            autovalidateMode: autovalidateMode,
            inputFormatters: inputFormatters,
            style: const TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              errorMaxLines: 5,
              suffixIcon: icon,
              fillColor: AppColor.black15,
              filled: true,
              hintText: '入力してください',
              hintStyle: TextStyle(
                color: AppColor.grey88,
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.grey88,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.grey88,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.red,

                  /// ここは後で変更する
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.grey88,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.red,

                  /// ここは後で変更する
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
