import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(mask: ' ###-##-##', filter: { "#": RegExp(r'[0-9]') });
    final form = FormGroup({
      'phone': FormControl<String>(),
    });
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Center(
            child: Text('Enter phone number'),
          ),
          Center(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    // alignment: AlignmentDirectional.centerStart,
                    children: [
                      ReactiveTextField(
                        inputFormatters: [maskFormatter],
                        formControlName: 'phone',
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        cursorHeight: 15,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 90),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 0),
                        child: CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'UA',
                          favorite: const ['+390', 'UA'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          flagWidth: 15,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
