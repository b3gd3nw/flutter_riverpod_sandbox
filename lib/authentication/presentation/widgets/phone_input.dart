import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freshcode_loyalty_t3/authentication/domain/notifiers/validate_notifier.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/utilities/validator.dart';
import 'package:freshcode_loyalty_t3/text_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:riverpod/riverpod.dart';

final inputProvider =
    StateNotifierProvider.autoDispose<ValidateNotifier, Validator>(
        (ref) => ValidateNotifier());

class PhoneInput extends ConsumerWidget {
  final MaskTextInputFormatter mask;
  final TextEditingController controller;

  PhoneInput({Key? key, required this.mask, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FormzStatus validatorStatus = ref.watch(inputProvider).status;
    print(validatorStatus);
    return TextField(
      inputFormatters: [mask],
      controller: controller,
      cursorWidth: 1,
      cursorColor:
          (validatorStatus.isInvalid) ? Colors.red : Colors.greenAccent,
      key: const Key('userEditForm_phoneInput_textField'),
      onChanged: (phone) =>
          ref.read(inputProvider.notifier).phoneChanged(phone),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelStyle: TextStyle(
            color: (validatorStatus == FormzStatus.invalid)
                ? Colors.red
                : Colors.grey),
        labelText: TextConfig.phone_number,
        helperText: '',
        errorText: (validatorStatus == FormzStatus.invalid)
            ? "Обов'язкове поле"
            : null,
      ),
    );
  }
}
