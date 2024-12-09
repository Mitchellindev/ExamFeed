import 'package:exam_feed/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';

class PrimaryInputField extends TextFormField {
  PrimaryInputField({
    required BuildContext context,
    super.key,
    String? hintText,
    String? label,
    String? Function(String?)? validator,
    String? prefixIcon,
    int? maxLines,
    super.controller,
    super.onChanged,
    super.textCapitalization,
    super.inputFormatters,
    super.obscureText,
    bool required = true,
  }) : super(
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(label ?? ''),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 8,
                      top: 12,
                      bottom: 12,
                    ),
                    child: SvgPicture.asset(
                      prefixIcon,
                      width: 24,
                      height: 24,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.neutral400,
                width: 0.8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 0.8,
              ),
            ),
            
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.error,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.neutral10,
                width: 0.8,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.neutral400,
                width: 0.8,
              ),
            ),
            hintStyle: const TextStyle(
              color: AppColors.neutral600,
              fontSize: 12,
            ),
          ),
          maxLines: maxLines ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          
          
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          // onChanged: onChanged,
          validator: !required
              ? validator
              : ValidationBuilder()
                  .required()
                  .add(validator ?? (value) => null)
                  .build(),
        );
}

class BigInputField extends StatelessWidget {
  const BigInputField({required this.controller, super.key, this.hintText});

  final TextEditingController controller;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 10,
      validator: ValidationBuilder().required().build(),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textCapitalization: TextCapitalization.sentences,
      decoration:
          InputDecoration.collapsed(hintText: hintText ?? 'Type your message'),
    );
  }
}

// class DropDownInputField<T extends Object> extends StatelessWidget {
//   const DropDownInputField({
//     required this.items,
//     required this.onChanged,
//     super.key,
//   });

//   final ValueChanged<T> onChanged;
//   final List<T> items;

//   @override
//   Widget build(BuildContext context) {
//     return DropDownTextField(
//       // controller: controller,
//       textFieldDecoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.neutral400,
//             width: 0.8,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.primaryColor,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.error,
//             width: 0.8,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.error,
//           ),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.neutral10,
//             width: 0.8,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.neutral400,
//             width: 0.8,
//           ),
//         ),
//         hintStyle: const TextStyle(
//           color: AppColors.neutral600,
//           fontSize: 12,
//         ),
//         // hintText: l10n.input_phone_number,
//       ),
//       clearOption: false,
//       enableSearch: items.length > 5,
//       validator: (value) {
//         if (value == null) {
//           return 'Please select an option';
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onChanged: (value) => onChanged((value as DropDownValueModel).value as T),
//       dropDownList: items
//           .map((item) => DropDownValueModel(name: item.toString(), value: item))
//           .toList(),
//     );
//   }
// }

class SearchInputField extends TextFormField {
  SearchInputField({
    required BuildContext context,
    super.key,
    String? hintText,
    // String? Function(String?)? validator,
    String? prefixIcon,
    String? suffixIcon,
    int? maxLines,
    super.controller,
    super.onChanged,
    super.textCapitalization,
    super.inputFormatters,
    // bool required = true,
  }) : super(
          decoration: InputDecoration(
            fillColor: AppColors.neutral200,
            filled: true,
            hintText: hintText ?? 'Search Duduzili',
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 8,
                      top: 12,
                      bottom: 12,
                    ),
                    child: SvgPicture.asset(
                      prefixIcon,
                      width: 24,
                      height: 24,
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 8,
                      top: 12,
                      bottom: 12,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller?.clear();
                      },
                      child: SvgPicture.asset(
                        suffixIcon,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.neutral200,
                width: 0.8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.neutral200,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 0.8,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.error,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.neutral200,
                width: 0.8,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.neutral200,
                width: 0.8,
              ),
            ),
            hintStyle: const TextStyle(
              color: AppColors.neutral600,
              fontSize: 12,
            ),
          ),
          maxLines: maxLines ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        );
}
