import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.icon = const SizedBox(),
  });
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 48,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: onChanged,
            cursorColor: AppColor.white,
            style: const TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
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
