import 'package:flutter/material.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/widgets/login_form.dart';

import '../../../size_config.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: const TextSpan(
                          text: "Привіт!",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 32,
                              fontWeight: FontWeight.bold))),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '''Увійди в систему або зареєструйся,
щоб почати користуватися знижками''',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          height: 1.5,
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical! * 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 64, left: 32, right: 32),
                    child: Column(
                      children: [LoginForm()],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
