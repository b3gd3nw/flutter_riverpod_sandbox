import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final int id;

  const PinNumber({Key? key, required this.textEditingController, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50 ,
      child: TextFormField(
        key: ValueKey(this.id),
        onChanged: (String val) {
          if(val != '') {
            this.id == 6 ? FocusScope.of(context).unfocus() : FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        autofocus: true,
        controller: textEditingController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 32,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 13),
            filled: true,
            fillColor: Colors.white38,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(213, 241, 225, 1)),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(213, 241, 225, 1)),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            errorStyle: TextStyle(height: 0)
        ),
      ),
    );
  }
}

