import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'authentication/data/repositories/authentication_repository.dart';
import 'authentication/domain/services/auth_service.dart';

final phoneFormProvider = StateProvider<FormGroup>((ref) {
  return FormGroup({
    'phone': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });
});

final formProvider = StateProvider<FormGroup>((ref) {
  return FormGroup({
    'phone': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });
});

final maskProvider = StateProvider<MaskTextInputFormatter>((ref) {
  return MaskTextInputFormatter(
    mask: ' ###-##-###-#',
    filter: {"#": RegExp(r'[0-9]')},
  );
});
final authenticationProvider = Provider<AuthenticationRepository>((ref) {
  return AuthenticationRepository(
    auth: FirebaseAuth.instance,
  );
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});

final authServiceProvider = Provider<AuthService>(
    (ref) => AuthService(repository: ref.read(authenticationProvider)));
