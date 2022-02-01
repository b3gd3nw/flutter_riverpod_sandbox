import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/widgets/pin_number_input.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/widgets/submit_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

typedef ConfirmEmailOnPressCallback = Function({required String code});
typedef ResendCodeOnPressCallback = Function();

// Define a custom Form widget.
class ConfirmPhoneForm extends StatefulWidget {
  final ConfirmEmailOnPressCallback onSubmit;
  final ResendCodeOnPressCallback onResend;

  const ConfirmPhoneForm(
      {Key? key, required this.onSubmit, required this.onResend})
      : super(key: key);

  @override
  ConfirmPhoneFormState createState() {
    return ConfirmPhoneFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ConfirmPhoneFormState extends State<ConfirmPhoneForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _pinFormKey = GlobalKey<FormState>();
  final pinOneFormController = TextEditingController();
  final pinTwoFormController = TextEditingController();
  final pinThreeFormController = TextEditingController();
  final pinFourFormController = TextEditingController();
  final pinFiveFormController = TextEditingController();
  final pinSixFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _pinFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Введіть код з смс',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: PinCodeTextField(
                keyboardType: TextInputType.phone,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  borderRadius: BorderRadius.circular(2),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: false,
                // errorAnimationController: errorController,
                // controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                }, appContext: context,
              ),
            ),
            Countdown(
              seconds: 60,
              interval: Duration(milliseconds: 100),
              build: (
                context,
                time,
              ) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      if (time == 0.0) {
                        widget.onResend();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Відправити код ще раз ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                color: (time != 0) ? Colors.grey : Colors.blue,
                                fontSize: 12,
                              ),
                        ),
                        Visibility(
                          visible: (time != 0),
                          child: Text(
                            '(${time.toString()})',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  color:
                                      (time != 0) ? Colors.grey : Colors.blue,
                                  fontSize: 12,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
