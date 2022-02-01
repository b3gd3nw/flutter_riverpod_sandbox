import 'package:flutter/material.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/widgets/confirm_phone_form.dart';

import '../../../size_config.dart';

class PhoneConfirmationPage extends StatelessWidget {
  const PhoneConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
              alignment: AlignmentDirectional.center,
            )),
        child: Padding(
          padding: EdgeInsets.only(top: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ConfirmPhoneForm(
                      onSubmit: ({required String code}) async {

                      },
                      onResend: () => print('resend'),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
