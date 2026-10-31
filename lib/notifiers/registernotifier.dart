import 'dart:async';

import 'package:final_e_commerce/models/loginrequest.dart';
import 'package:final_e_commerce/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Registernotifier extends AsyncNotifier<dynamic> {
  @override
  FutureOr<dynamic> build() {
    return null;
  }

  Future<dynamic> registerUser(Loginrequest body) async {
    state = AsyncLoading();
    try {
      final serv = ref.read(registerServProvider);
      final resond =await serv.register(body: body);
      state = AsyncData(resond); 
    } catch (e,stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }
}
