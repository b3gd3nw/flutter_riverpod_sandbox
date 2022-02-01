import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:freshcode_loyalty_t3/authentication/data/models/phone_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Validator extends Equatable {
  const Validator({
    this.phone = const Phone.pure(),
    this.errorMessage,
    this.status = FormzStatus.pure,
  });

  final Phone phone;
  final String? errorMessage;
  final FormzStatus status;


  Validator copyWith({
    Phone? phone,
    String? errorMessage,
    FormzStatus? status,
  }) {
    return Validator(
      phone: phone ?? this.phone,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [phone, status];
}
