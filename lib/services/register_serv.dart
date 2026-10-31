
import 'package:dio/dio.dart';
import 'package:final_e_commerce/models/loginrequest.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'register_serv.g.dart';

  @RestApi(baseUrl:'https://zgbenkuzyjsyiygyogme.supabase.co')
  abstract class RegisterServ {
    factory RegisterServ(Dio dio)=_RegisterServ;

    @POST('/auth/v1/signup')
    Future <dynamic> register ({@Body()required Loginrequest body});
  }