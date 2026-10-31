// login
import 'package:dio/dio.dart';
import 'package:final_e_commerce/models/loginresponse.dart';
import 'package:final_e_commerce/notifiers/loginNotifier.dart';
import 'package:final_e_commerce/notifiers/registernotifier.dart';
import 'package:final_e_commerce/services/login_serv.dart';
import 'package:final_e_commerce/services/register_serv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      headers: {
        'apikey': 'sb_publishable_W8WLzNkkzkdiP40dfTPZ4A_je2LseoG',
        'Content-Type': 'application/json',
      },
    ),
  );
});

final loginServProvider = Provider<LoginServ>((ref) {
  return LoginServ(ref.read(dioProvider));
});

final loginNotifierProvider =
    AsyncNotifierProvider<Loginnotifier, Loginresponse?>(Loginnotifier.new);

// login
//-----//

//register
final registerServProvider = Provider<RegisterServ>((ref) {
  return RegisterServ(ref.read(dioProvider));
});

final registerNotifierProvider =
    AsyncNotifierProvider.autoDispose<Registernotifier, dynamic>(
      Registernotifier.new,
    );

//register
