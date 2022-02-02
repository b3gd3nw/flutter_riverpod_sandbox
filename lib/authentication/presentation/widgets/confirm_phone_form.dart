import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'login_form.dart';

class ConfirmPhoneForm extends ConsumerWidget {
  const ConfirmPhoneForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(signInPhoneModelProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
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
                print("Completed - $v");
                auth.verifyCode(v);
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              }, appContext: context, onChanged: (String value) {  },
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
    );
  }
}
