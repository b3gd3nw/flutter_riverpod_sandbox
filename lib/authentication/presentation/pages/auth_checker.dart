import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/pages/error_page.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/pages/phone_verification_page.dart';
import 'package:freshcode_loyalty_t3/core/presentation/pages/loading_screen.dart';
import 'package:freshcode_loyalty_t3/home/presentation/pages/partners_page.dart';

import '../../../global_providers.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) return const PartnersPage();
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => const PhoneVerificationPage(),
              ),
            ],
          );
        },
        loading: () => const LoadingScreen(),
        error: (e, trace) => ErrorPage(errorMessage: e.toString()));
  }
}
