import 'dart:async';

import 'package:dio/dio.dart';
import 'package:final_e_commerce/handle/error_handle.dart';
import 'package:final_e_commerce/local/storage_token.dart';
import 'package:final_e_commerce/models/loginrequest.dart';
import 'package:final_e_commerce/models/loginresponse.dart';
import 'package:final_e_commerce/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Loginnotifier extends AsyncNotifier<Loginresponse?> {
  @override
  FutureOr<Loginresponse?> build() async {
    return null;
  }

  Future<void> loginUser(Loginrequest body) async {
    state = const AsyncLoading();

    try {
      final storage = StorageToken();
      final serv = ref.read(loginServProvider);

      final respond = await serv.login(body: body);

      await storage.saveToken(respond.access_token);

      state = AsyncData(respond);
    } on DioException catch (e, stackTrace) {
      final exception = ErrorHandle.handle(e);
      state = AsyncValue.error(exception, stackTrace);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
