  
  import 'package:dio/dio.dart';
import 'package:final_e_commerce/models/loginrequest.dart';
import 'package:final_e_commerce/models/loginresponse.dart';
import 'package:retrofit/retrofit.dart';

part 'login_serv.g.dart';

  @RestApi(baseUrl:'https://zgbenkuzyjsyiygyogme.supabase.co')

  abstract class LoginServ {
    factory LoginServ(Dio dio)=_LoginServ;

    @POST("/auth/v1/token?grant_type=password")
    Future<Loginresponse>login({@Body()required Loginrequest body });
  }